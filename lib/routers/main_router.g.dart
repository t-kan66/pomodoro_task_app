// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $timerPageRoute,
    ];

RouteBase get $timerPageRoute => GoRouteData.$route(
      path: '/',
      factory: $TimerPageRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: '/settings',
          factory: $SettingsPageRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/timer_setting',
          factory: $TimerSettingPageRouteExtension._fromState,
        ),
      ],
    );

extension $TimerPageRouteExtension on TimerPageRoute {
  static TimerPageRoute _fromState(GoRouterState state) => TimerPageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingsPageRouteExtension on SettingsPageRoute {
  static SettingsPageRoute _fromState(GoRouterState state) =>
      SettingsPageRoute();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TimerSettingPageRouteExtension on TimerSettingPageRoute {
  static TimerSettingPageRoute _fromState(GoRouterState state) =>
      TimerSettingPageRoute();

  String get location => GoRouteData.$location(
        '/timer_setting',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
