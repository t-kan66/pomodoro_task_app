import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/feature/timer/widgets/progress_circles.dart';
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
        title: Text(
          l10n.pomodoro_title,
          style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 26), // 大きめ
        ), // l10nを使用
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 32.0, vertical: 32.0), // 余白を大きく
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${l10n.working_phase}',
                    style: const TextStyle(
                      fontSize: 40, // 大きめ
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    '${timerState.initalDurationTime.inMinutes} ${l10n.minutes}',
                    style: const TextStyle(
                      fontSize: 34, // 大きめ
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    l10n.resting_phase,
                    style: const TextStyle(
                      fontSize: 40, // 大きめ
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    '${timerState.initialBreakDuration.inMinutes} ${l10n.minutes}',
                    style: const TextStyle(
                      fontSize: 34, // 大きめ
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // 丸型進捗バー表示
                  const SizedBox(height: 48),
                  const ProgressCircle(),
                  const SizedBox(height: 32),
                  const SizedBox(height: 60),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 20), // 大きめ
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        enableDrag: false,
                        isScrollControlled: true,
                        useSafeArea: true,
                        builder: (context) => const TimerModal(),
                      );
                    },
                    child: Text(
                      l10n.start_pomodoro,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold), // 大きめ
                    ), // l10nを使用
                  ),
                ],
              ),
            ),
          ),
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
      canPop: !timerState.isRunning,
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
                if (timerState.isRunning) {
                  showDialog(
                    context: context,
                    builder: (BuildContext dialogContext) {
                      return _CloseConfirmDialog(onClose: () {
                        ref
                            .read(timerControllerProvider.notifier)
                            .stopPomodoro(); // タイマーを停止
                        Navigator.of(context).pop(); // モーダルを閉じる
                      });
                    },
                  );
                } else {
                  Navigator.of(context).pop(); // タイマーが動いていない場合はそのまま閉じる
                }
              },
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
          ],
        ),
      ),
    );
  }
}

class _CloseConfirmDialog extends ConsumerWidget {
  const _CloseConfirmDialog({
    required this.onClose,
  });

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    return AlertDialog(
      title: Text(l10n.close_confirm_title),
      content: Text(l10n.close_confirm_message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(l10n.no),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onClose();
          },
          child: Text(l10n.yes),
        ),
      ],
    );
  }
}

class _WorkingWidget extends ConsumerWidget {
  const _WorkingWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final timerState = ref.watch(timerControllerProvider);

    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.working_phase,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${timerState.initalDurationTime.inMinutes} ${l10n.minutes}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            const PomodoroCircle(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!timerState.isRunning) ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () => ref
                        .read(timerControllerProvider.notifier)
                        .startPomodoro(),
                    child: Text(
                      l10n.working_start,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ] else ...[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () => ref
                        .read(timerControllerProvider.notifier)
                        .stopPomodoro(),
                    child: Text(
                      l10n.working_stop,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
    final timerState = ref.watch(timerControllerProvider);

    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.resting_phase,
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '${timerState.initialBreakDuration.inMinutes} ${l10n.minutes}',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            const PomodoroCircle(),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () =>
                      ref.read(timerControllerProvider.notifier).startBreak(),
                  child: Text(
                    l10n.working_start,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () =>
                      ref.read(timerControllerProvider.notifier).stopPomodoro(),
                  child: Text(
                    l10n.working_stop,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PomodoroCircle extends HookConsumerWidget {
  const PomodoroCircle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerControllerProvider);

    // ステータスによって色を切り替え
    final isWork = state.status == PomodoroStatus.work;
    final progressColor = isWork
        ? const Color(0xFFE57373) // アクティブな赤系
        : const Color(0xFF4DD0E1); // リラックスできる青緑系
    final bgColor = isWork
        ? const Color(0xFFFFEBEE) // 赤系の淡い背景
        : const Color(0xFFE0F7FA); // 青緑系の淡い背景

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(120), // 角を丸く
        child: Container(
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: 1 -
                      state.currentDurationTime.inSeconds /
                          state.initalDurationTime.inSeconds,
                  strokeWidth: 40, // 縁を太く
                  backgroundColor: bgColor,
                  color: progressColor,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    _formatTime(state.currentDurationTime),
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    '${state.completedPomodoros} / 4',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
