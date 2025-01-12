import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_redirect_state.freezed.dart';

// 起動ステータス
sealed class LaunchState {
  const LaunchState();

  const factory LaunchState.launching() = LaunchingStatus;
  const factory LaunchState.completed() = CompletedStatus;
  const factory LaunchState.failed(Object error, StackTrace stackTrace) =
      FailedStatus;
}

final class LaunchingStatus extends LaunchState {
  const LaunchingStatus();
}

final class CompletedStatus extends LaunchState {
  const CompletedStatus();
}

final class FailedStatus extends LaunchState {
  const FailedStatus(this.error, this.stackTrace);

  final Object error;
  final StackTrace stackTrace;
}

@freezed
class RouteRedirectState with _$RouteRedirectState {
  const factory RouteRedirectState({
    required LaunchState launchState,
    required bool isSigning,
  }) = _RouteRedirectState;
}
