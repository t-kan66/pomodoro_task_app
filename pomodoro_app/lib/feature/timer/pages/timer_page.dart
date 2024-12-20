import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../widget/pomodoro_circle.dart';

class TimerPage extends HookConsumerWidget {
  const TimerPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ポモドーロタイマー'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PomodoroCircle(),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: null, // TODO: タイマー開始処理を追加
                  child: Text('開始'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: null, // TODO: タイマーリセット処理を追加
                  child: Text('リセット'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
