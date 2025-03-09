import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/l10n/l10n_provider.dart';
import 'package:pomodoro_app/routers/main_router.dart';
import '../controllers/controller.dart';

class TimerPage extends HookConsumerWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerControllerProvider);

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  //print('settings')
                  ref.read(mainRouterProvider).go(SettingsPageRoute().location);
                }),
          ],

          // title: const Text('Pomodoro Timer'),
          foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          backgroundColor: const Color.fromARGB(234, 232, 232, 232),
        ),
        body: switch (timerState.status) {
          PomodoroStatus.work => const _WorkingWidget(),
          PomodoroStatus.rest => const _RestWidget(),
        });
  }
}

class _WorkingWidget extends ConsumerWidget {
  const _WorkingWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final timerState = ref.watch(timerControllerProvider);

    return Container(
      color: const Color.fromARGB(255, 198, 224, 166),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PomodoroCircle(),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!timerState.isRunning) ...[
                  ElevatedButton(
                    onPressed: () => ref
                        .read(timerControllerProvider.notifier)
                        .startPomodoro(),
                    child: Text(l10n.working_start),
                  ),
                ] else ...[
                  ElevatedButton(
                    onPressed: () => ref
                        .read(timerControllerProvider.notifier)
                        .stopPomodoro(),
                    child: Text(l10n.working_stop),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RestWidget extends ConsumerWidget {
  const _RestWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const PomodoroCircle(),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () =>
                    ref.read(timerControllerProvider.notifier).startBreak(),
                child: Text(l10n.working_start),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: () =>
                    ref.read(timerControllerProvider.notifier).stopPomodoro(),
                child: Text(l10n.working_stop),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class PomodoroCircle extends HookConsumerWidget {
  const PomodoroCircle({super.key});

  // timer開始のhandler

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerControllerProvider);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: CircularProgressIndicator(
            value: 1 -
                state.currentDurationTime.inSeconds /
                    state.initalDurationTime.inSeconds,
            strokeWidth: 30,
            backgroundColor: const Color.fromARGB(255, 213, 196, 201),
            color: const Color.fromARGB(255, 209, 138, 162),
          ),
        ),
        Column(
          children: [
            Text(
              _formatTime(state.currentDurationTime),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${state.completedPomodoros} / 4',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ],
    );
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
