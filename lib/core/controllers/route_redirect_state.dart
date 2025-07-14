import 'package:freezed_annotation/freezed_annotation.dart';
import 'auth_state.dart';
import 'update_info.dart';

part 'route_redirect_state.freezed.dart';

@freezed
class LaunchState with _$LaunchState {
  const factory LaunchState.launching() = LaunchingStatus;
  const factory LaunchState.completed() = CompletedStatus;
  const factory LaunchState.failed(Object error, StackTrace stackTrace) = FailedStatus;
}

@freezed
class RouteRedirectState with _$RouteRedirectState {
  const factory RouteRedirectState({
    required LaunchState launchState,
    required bool isSigning,
    UpdateInfo? updateInfo,
    AuthState? authState,
  }) = _RouteRedirectState;
}
