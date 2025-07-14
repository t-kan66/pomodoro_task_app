import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_state.dart';

// AsyncNotifierを使用したAuthController
class AuthController extends AsyncNotifier<AuthState> {
  late SharedPreferences _prefs;

  @override
  Future<AuthState> build() async {
    _prefs = await SharedPreferences.getInstance();
    return await _checkAuthStatus();
  }

  // アプリ起動時にログイン状態をチェック
  Future<AuthState> _checkAuthStatus() async {
    final isLoggedIn = _prefs.getBool('is_logged_in') ?? false;
    final userId = _prefs.getString('user_id');
    final userEmail = _prefs.getString('user_email');

    if (isLoggedIn && userId != null) {
      return AuthState(
        status: AuthStatus.authenticated,
        userId: userId,
        userEmail: userEmail,
      );
    } else {
      return const AuthState(status: AuthStatus.unauthenticated);
    }
  }

  // ログイン処理
  Future<bool> login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        final userId = 'user_${DateTime.now().millisecondsSinceEpoch}';
        
        // SharedPreferencesに保存
        await _prefs.setBool('is_logged_in', true);
        await _prefs.setString('user_id', userId);
        await _prefs.setString('user_email', email);

        final newState = AuthState(
          status: AuthStatus.authenticated,
          userId: userId,
          userEmail: email,
        );
        
        state = AsyncValue.data(newState);
        return true;
      }
      return false;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
      return false;
    }
  }

  // ログアウト処理
  Future<void> logout() async {
    try {
      await _prefs.remove('is_logged_in');
      await _prefs.remove('user_id');
      await _prefs.remove('user_email');

      state = const AsyncValue.data(AuthState(status: AuthStatus.unauthenticated));
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  // 強制ログイン状態設定（デバッグ用）
  Future<void> setLoginStatus(bool isLoggedIn) async {
    if (isLoggedIn) {
      await login('test@example.com', 'password');
    } else {
      await logout();
    }
  }
}

// AuthControllerのProvider
final authControllerProvider = AsyncNotifierProvider<AuthController, AuthState>(
  AuthController.new,
);
