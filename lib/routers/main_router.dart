import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/core/controllers/controller.dart';
import 'package:pomodoro_app/feature/auth/pages/login_page.dart';
import 'package:pomodoro_app/feature/setting/pages/page.dart';
import 'package:pomodoro_app/feature/setting/pages/timer_settings_page.dart';
import 'package:pomodoro_app/feature/splash/pages/splash_page.dart';
import 'package:pomodoro_app/feature/timer/pages/page.dart';
import 'package:pomodoro_app/feature/update/pages/force_update_wrapper_page.dart';
import 'package:pomodoro_app/feature/update/widgets/optional_update_dialog.dart';

part 'main_router.g.dart';

final mainRouterProvider = Provider<GoRouter>((ref) {
  // RouteRedirectControllerの状態変化を監視するためのNotifier
  final routeNotifier = RouteChangeNotifier(ref);
  
  return GoRouter(
    initialLocation: SplashPageRoute().location,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: routeNotifier,
    redirect: (context, state) {
      print('🔄 Router: redirect called for path: ${state.uri.path}');
      
      // ref.readを使用（watchは使わない）
      final redirectStateAsync = ref.read(routeRedirectControllerProvider);

      return redirectStateAsync.when(
        data: (redirectState) {
          final currentPath = state.uri.path;
          print('✅ Router: Data state - currentPath: $currentPath, launchState: ${redirectState.launchState}');

          // 強制アップデートが必要な場合
          if (redirectState.updateInfo?.updateType == 2) {
            if (currentPath != ForceUpdatePageRoute().location) {
              return ForceUpdatePageRoute().location;
            }
            return null;
          }

          // スプラッシュ画面の場合、起動状態をチェック
          if (currentPath == SplashPageRoute().location) {
            switch (redirectState.launchState) {
              case LaunchingStatus():
                print('⏳ Router: Still launching, staying on splash');
                return null; // スプラッシュ画面のまま
              case CompletedStatus():
                print('🎯 Router: Launch completed, checking auth status');
                // 起動完了後の遷移判定
                if (redirectState.authState?.status == AuthStatus.unauthenticated) {
                  print('🔐 Router: Redirecting to login (unauthenticated)');
                  return LoginPageRoute().location;
                } else if (redirectState.authState?.status == AuthStatus.authenticated) {
                  print('✅ Router: Redirecting to timer (authenticated)');
                  // 任意アップデートがある場合はダイアログを表示するためタイマー画面へ
                  return TimerPageRoute().location;
                } else if (redirectState.authState?.status == AuthStatus.unknown) {
                  print('❓ Router: Auth status unknown, redirecting to login');
                  return LoginPageRoute().location;
                }
                print('⚠️ Router: Unexpected auth status, staying on splash');
                return null;
              case FailedStatus():
                print('❌ Router: Launch failed, redirecting to login');
                // エラーが発生した場合はログイン画面へ
                return LoginPageRoute().location;
            }
          }

          // ログイン画面以外で未認証の場合はログイン画面へリダイレクト
          if (redirectState.authState?.status == AuthStatus.unauthenticated &&
              currentPath != LoginPageRoute().location &&
              currentPath != SplashPageRoute().location &&
              currentPath != ForceUpdatePageRoute().location) {
            return LoginPageRoute().location;
          }

          // 認証済みでログイン画面にいる場合はタイマー画面へリダイレクト
          if (redirectState.authState?.status == AuthStatus.authenticated &&
              currentPath == LoginPageRoute().location) {
            return TimerPageRoute().location;
          }

          return null;
        },
        loading: () {
          print('⏳ Router: Loading state');
          // ローディング中はスプラッシュ画面を表示
          if (state.uri.path != SplashPageRoute().location) {
            return SplashPageRoute().location;
          }
          return null;
        },
        error: (error, stack) {
          print('❌ Router: Error state - $error');
          // エラーが発生した場合はログイン画面へ
          if (state.uri.path != LoginPageRoute().location) {
            return LoginPageRoute().location;
          }
          return null;
        },
      );
    },
    routes: $appRoutes,
  );
});

@TypedGoRoute<SplashPageRoute>(path: '/splash')
class SplashPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<LoginPageRoute>(path: '/login')
class LoginPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@TypedGoRoute<ForceUpdatePageRoute>(path: '/force-update')
class ForceUpdatePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ForceUpdateWrapperPage();
  }
}

@TypedGoRoute<TimerPageRoute>(path: '/', routes: [
  TypedGoRoute<SettingsPageRoute>(
    path: '/settings',
  ),
  TypedGoRoute<TimerSettingPageRoute>(path: '/timer_setting'),
])
class TimerPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Consumer(
      builder: (context, ref, child) {
        // 任意アップデートダイアログの表示判定
        final redirectStateAsync = ref.watch(routeRedirectControllerProvider);

        redirectStateAsync.whenData((redirectState) {
          if (redirectState.updateInfo?.updateType == 1) {
            // 任意アップデートダイアログを一度だけ表示
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                OptionalUpdateDialog.show(context, redirectState.updateInfo!);
              }
            });
          }
        });

        return const TimerPage();
      },
    );
  }
}

class SettingsPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsPage();
  }
}

class TimerSettingPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TimerSettingsPage();
  }
}

// RouteRedirectControllerの状態変化を監視するためのNotifier
class RouteChangeNotifier extends ChangeNotifier {
  final Ref ref;
  RouteChangeNotifier(this.ref) {
    // RouteRedirectControllerの状態変化を監視
    ref.listen(routeRedirectControllerProvider, (previous, next) {
      notifyListeners();
    });
  }
}

// @TypedStatefulShellRoute<MainShellRouteData>(
//   branches: <TypedStatefulShellBranchRoute>[
//     TypedStatefulShellBranchRoute(
//       routes: <TypedGoRoute>[
//         TimerPageRoute(),
//         SettingsPageRoute(),
//       ],
//     ),
//   ])
