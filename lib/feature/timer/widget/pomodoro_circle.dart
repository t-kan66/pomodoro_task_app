import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PomodoroCircle extends HookConsumerWidget {
  const PomodoroCircle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // アニメーションコントローラーの設定
    final controller = useAnimationController(
      duration: const Duration(minutes: 25), // ポモドーロのデフォルト時間
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 300,
          height: 300,
          child: CircularProgressIndicator(
            value: controller.value,
            strokeWidth: 10,
            backgroundColor: Colors.grey[300],
            color: Colors.red,
          ),
        ),
        Text(
          _formatTime(controller.duration! * (1 - controller.value)),
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
