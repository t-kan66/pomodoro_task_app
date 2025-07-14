import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pomodoro_app/core/controllers/route_redirect_controller.dart';
import 'package:pomodoro_app/feature/update/pages/force_update_page.dart';
import 'package:pomodoro_app/feature/splash/pages/splash_page.dart';

class ForceUpdateWrapperPage extends ConsumerWidget {
  const ForceUpdateWrapperPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final redirectStateAsync = ref.watch(routeRedirectControllerProvider);
    
    return redirectStateAsync.when(
      data: (redirectState) {
        if (redirectState.updateInfo != null) {
          return ForceUpdatePage(updateInfo: redirectState.updateInfo!);
        }
        // updateInfoがない場合はログイン画面へ
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.go('/login');
        });
        return const SizedBox.shrink();
      },
      loading: () => const SplashPage(),
      error: (error, stack) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.go('/login');
        });
        return const SizedBox.shrink();
      },
    );
  }
}
