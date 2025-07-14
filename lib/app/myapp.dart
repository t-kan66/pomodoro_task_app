import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/l10n/app_localizations.dart';
import 'package:pomodoro_app/routers/main_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainRouter = ref.watch(mainRouterProvider);

    return MaterialApp.router(
      title: 'ポモドーロタスクアプリ',
      localizationsDelegates: L10n.localizationsDelegates,
      supportedLocales: L10n.supportedLocales,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerDelegate: mainRouter.routerDelegate,
      routeInformationParser: mainRouter.routeInformationParser,
      routeInformationProvider: mainRouter.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}


