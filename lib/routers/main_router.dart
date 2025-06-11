import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/feature/setting/pages/timer_settings_page.dart';

import '../feature/setting/pages/page.dart';
import '../feature/timer/pages/page.dart';

part 'main_router.g.dart';

final mainRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
      initialLocation: TimerPageRoute().location,
      debugLogDiagnostics: kDebugMode,
      redirect: (context, state) {
        return null;
      },
      routes: $appRoutes);
});

@TypedGoRoute<TimerPageRoute>(path: '/', routes: [
  TypedGoRoute<SettingsPageRoute>(
    path: '/settings',
  ),
  TypedGoRoute<TimerSettingPageRoute>(path: '/timer_setting'),
])
class TimerPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TimerPage();
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

// @TypedStatefulShellRoute<MainShellRouteData>(
//   branches: <TypedStatefulShellBranchRoute>[
//     TypedStatefulShellBranchRoute(
//       routes: <TypedGoRoute>[
//         TimerPageRoute(),
//         SettingsPageRoute(),
//       ],
//     ),
//   ])