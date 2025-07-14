import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

// ログイン状態を管理する列挙型
enum AuthStatus {
  unknown,      // 初期状態（チェック中）
  authenticated, // ログイン済み
  unauthenticated, // 未ログイン
}

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required AuthStatus status,
    String? userId,
    String? userEmail,
  }) = _AuthState;

  factory AuthState.fromJson(Map<String, dynamic> json) => _$AuthStateFromJson(json);
}
