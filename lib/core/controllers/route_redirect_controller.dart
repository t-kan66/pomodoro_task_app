import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/core/controllers/controller.dart';

final routeRedirectControllerProvider = AutoDisposeAsyncNotifierProvider<
    RouteRedirectController, RouteRedirectState>(RouteRedirectController.new);

class RouteRedirectController
    extends AutoDisposeAsyncNotifier<RouteRedirectState> {
  @override
  Future<RouteRedirectState> build() async {
    try {
      // 起動中の状態を設定
      state = const AsyncValue.data(RouteRedirectState(
        launchState: LaunchState.launching(),
        isSigning: true,
        updateInfo: null,
        authState: null,
      ));

      // アップデート情報を並行して取得
      final updateInfoFuture = ref.read(appUpdateControllerProvider).getUpdateInfo();
      
      // ログイン状態を並行して取得
      final authStateAsync = ref.read(authControllerProvider);
      
      // 両方の情報を待機
      final updateInfo = await updateInfoFuture;
      final authState = await authStateAsync.when(
        data: (state) => Future.value(state),
        loading: () => Future.value(const AuthState(status: AuthStatus.unknown)),
        error: (error, stack) => Future.value(const AuthState(status: AuthStatus.unauthenticated)),
      );

      // 強制アップデートが必要な場合
      if (updateInfo.updateType == 2) {
        return RouteRedirectState(
          launchState: const LaunchState.completed(),
          isSigning: false,
          updateInfo: updateInfo,
          authState: authState,
        );
      }

      // 認証状態によって処理を分岐
      final bool isSigning = authState.status == AuthStatus.unknown;

      return RouteRedirectState(
        launchState: const LaunchState.completed(),
        isSigning: isSigning,
        updateInfo: updateInfo,
        authState: authState,
      );
    } catch (error, stackTrace) {
      return RouteRedirectState(
        launchState: LaunchState.failed(error, stackTrace),
        isSigning: false,
        updateInfo: null,
        authState: const AuthState(status: AuthStatus.unauthenticated),
      );
    }
  }

  // ログイン状態変更時に状態を更新
  void onAuthStateChanged() {
    ref.invalidateSelf();
  }

  // 強制的に状態を更新
  void refresh() {
    ref.invalidateSelf();
  }
}
