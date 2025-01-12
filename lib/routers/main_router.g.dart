// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $timerPageRoute,
    ];

RouteBase get $timerPageRoute => GoRouteData.$route(
      path: '/timer',
      factory: $TimerPageRouteExtension._fromState,
    );

extension $TimerPageRouteExtension on TimerPageRoute {
  static TimerPageRoute _fromState(GoRouterState state) => TimerPageRoute();

  String get location => GoRouteData.$location(
        '/timer',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
