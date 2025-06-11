import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/l10n/app_localizations.dart';
import 'package:pomodoro_app/routers/main_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/controllers/update_controller.dart';
import '../core/controllers/controller.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainRouter = ref.read(mainRouterProvider);
    final appUpdateController = ref.read(appUpdateControllerProvider);

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
      builder: (context, child) {
        return FutureBuilder<UpdateInfo>(
          future: appUpdateController.getUpdateInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              final updateInfo = snapshot.data!;
              if (updateInfo.updateType == 2) {
                // 強制アップデートダイアログ
                return ForceUpdateDialog(updateInfo: updateInfo);
              } else if (updateInfo.updateType == 1) {
                // 任意アップデートダイアログ
                return OptionalUpdateDialog(
                    updateInfo: updateInfo, child: child!);
              }
            }
            return child ?? const SizedBox.shrink();
          },
        );
      },

//      home: const ProviderScope(child: TimerPage()),
    );
  }
}

class ForceUpdateDialog extends StatelessWidget {
  final UpdateInfo updateInfo;
  const ForceUpdateDialog({required this.updateInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('アップデート必須'),
      content: Text(updateInfo.message),
      actions: [
        TextButton(
          onPressed: () {
            // ストアURLへ遷移
            launchUrl(updateInfo.storeUrl);
          },
          child: const Text('アップデート'),
        ),
      ],
    );
  }
}

class OptionalUpdateDialog extends StatelessWidget {
  final UpdateInfo updateInfo;
  final Widget child;
  const OptionalUpdateDialog(
      {required this.updateInfo, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('アップデートのお知らせ'),
          content: Text(updateInfo.message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('あとで'),
            ),
            TextButton(
              onPressed: () {
                launchUrl(updateInfo.storeUrl);
              },
              child: const Text('アップデート'),
            ),
          ],
        ),
      );
    });
    return child;
  }
}

void launchUrl(String url) {
  // 実装例: url_launcherパッケージを利用
  // launch(url);
}
