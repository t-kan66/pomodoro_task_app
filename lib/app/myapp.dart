import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pomodoro_app/routers/main_router.dart';

import '../feature/timer/pages/page.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainRouter = ref.read(mainRouterProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerDelegate: mainRouter.routerDelegate,
      routeInformationParser: mainRouter.routeInformationParser,
      routeInformationProvider: mainRouter.routeInformationProvider,

//      home: const ProviderScope(child: TimerPage()),
    );
  }
}
