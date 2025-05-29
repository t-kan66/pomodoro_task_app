import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/l10n/l10n_provider.dart';
import '../../setting/controllers/controller.dart';
import '../controllers/controller.dart';

class TimerPage extends HookConsumerWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider); // l10nを定義
    final timerState = ref.watch(timerControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.pomodoro_title), // l10nを使用
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        backgroundColor: const Color.fromARGB(234, 232, 232, 232),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              enableDrag: false,
              isScrollControlled: true,
              useSafeArea: true,
              // isDismissible: !timerState.isRunning,
              builder: (context) => const TimerModal(),
            );
          },
          child: Text(l10n.start_pomodoro), // l10nを使用
        ),
      ),
    );
  }
}

class TimerModal extends HookConsumerWidget {
  const TimerModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerControllerProvider);

    useEffect(() {
      ref.read(timerSettingsControllerProvider.notifier).getSettings();
      return null;
    }, [timerState]);

    return PopScope(
      //  canPop: !timerState.isRunning,
      child: Scaffold(
        body: Stack(
          children: [
            switch (timerState.status) {
              PomodoroStatus.work => const _WorkingWidget(),
              PomodoroStatus.rest => const _RestWidget(),
            },
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return _CloseConfirmDialog(onClose: () {
                      ref
                          .read(timerControllerProvider.notifier)
                          .stopPomodoro(); // タイマーを停止
                      Navigator.of(dialogContext).pop(); // モーダルを閉じる
                    });
                  },
                );
              },
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}

class _CloseConfirmDialog extends StatelessWidget {
  const _CloseConfirmDialog({
    required this.onClose,
  });

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("確認"),
      content: const Text("タイマーをストップし、画面を閉じます。"),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context); // ダイアログを閉じる
          },
          child: const Text("いいえ"),
        ),
        TextButton(
          onPressed: onClose,
          child: const Text("はい"),
        ),
      ],
    );
  }
}

class _WorkingWidget extends ConsumerWidget {
  const _WorkingWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider); // l10nを定義
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
    final l10n = ref.watch(l10nProvider); // l10nを定義
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
