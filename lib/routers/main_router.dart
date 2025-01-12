import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

@TypedGoRoute<TimerPageRoute>(path: '/timer')
class TimerPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TimerPage();
  }
}
