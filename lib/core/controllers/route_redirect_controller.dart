import 'package:hooks_riverpod/hooks_riverpod.dart';

final routeRedirectControllerProvider =
    NotifierProvider<RouteRedirectController, bool>(() {

      
  return RouteRedirectController();
});

class RouteRedirectController extends Notifier<bool> {
  @override
  bool build() {
    return false;
  }
}
