import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../controllers/controller.dart';
import '../widget/pomodoro_circle.dart';

class TimerPage extends HookConsumerWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timerState = ref.watch(timerControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ポモドーロタイマー'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const PomodoroCircle(),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => ref
                      .read(timerControllerProvider.notifier)
                      .startPomodoro(),
                  child: const Text('開始'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () =>
                      ref.read(timerControllerProvider.notifier).stopPomodoro(),
                  child: const Text('ストップ'),
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
            value: state.currentWorkingDuration.inSeconds /
                state.initialWorkingDuration.inSeconds,
            strokeWidth: 10,
            backgroundColor: Colors.grey[300],
            color: Colors.red,
          ),
        ),
        Text(
          _formatTime(state.currentWorkingDuration),
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
          ),
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
