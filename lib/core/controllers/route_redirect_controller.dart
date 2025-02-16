import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/core/controllers/route_redirect_state.dart';

final routeRedirectControllerProvider = AutoDisposeAsyncNotifierProvider<
    RouteRedirectController, RouteRedirectState>(RouteRedirectController.new);

class RouteRedirectController
    extends AutoDisposeAsyncNotifier<RouteRedirectState> {
  @override
  RouteRedirectState build() {
    return const RouteRedirectState(
      launchState: LaunchingStatus(),
      isSigning: false,
    );
  }


}
