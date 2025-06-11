import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/l10n/l10n_provider.dart';
import 'package:pomodoro_app/routers/main_router.dart';
import '../../../core/controllers/controller.dart';
import '../../../core/infras/infras.dart';
import '../../../gen/assets.gen.dart';
import '../../setting/controllers/controller.dart';
import '../controllers/controller.dart';
import 'dart:math' as math;

class TimerPage extends HookConsumerWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);
    final timerState = ref.watch(timerControllerProvider);
    final soundSetting = ref.watch(soundSettingProvider);

    // 追加: カウントダウン中かどうかの状態
    final countdowning = useState(false);

    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   l10n.pomodoro_title,
        //   style:
        //       const TextStyle(fontWeight: FontWeight.bold, fontSize: 26), // 大きめ
        // ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.timer_outlined, color: Colors.black),
          onPressed: () {
            ref.read(mainRouterProvider).go(
                  TimerSettingPageRoute().location,
                );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              ref.read(mainRouterProvider).go(
                    SettingsPageRoute().location,
                  );
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // タイトルをカードの上部に追加
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      l10n.pomodoro_title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  // 作業・休憩時間・フェーズ数を横長カードで並べる
                  InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: () {
                      ref.read(mainRouterProvider).go(
                            TimerSettingPageRoute().location,
                          );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.symmetric(
                          vertical: 28, horizontal: 32),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF7F7F7),
                        borderRadius: BorderRadius.circular(32),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // 作業
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                l10n.working_phase,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${timerState.initalDurationTime.inMinutes} ',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          // 休憩
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                l10n.resting_phase,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${timerState.initialBreakDuration.inMinutes}',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          // サイクル
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                l10n.cycles,
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                '${timerState.maxPomodoros}',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  // サウンドON/OFF設定スイッチ
                  const SizedBox(height: 20),
                  _SoundSwitch(),
                  const SizedBox(height: 48),
                  // 開始ボタンもカード下に配置
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(36),
                          ),
                        ),
                        onPressed: countdowning.value
                            ? null
                            : () async {
                                // サウンドONなら3秒前からカウントSEを鳴らす
                                final soundOn = ref.read(soundSettingProvider);
                                final soundManager =
                                    ref.read(soundManagerProvider);

                                if (soundSetting.soundOn) {
                                  countdowning.value = true;
                                  for (int i = 3; i > 0; i--) {
                                    final sePath = Assets.sounds.countdown
                                        .replaceFirst('assets/', '');

                                    await soundManager.playSe(sePath);
                                    await Future.delayed(
                                        const Duration(seconds: 1));
                                  }
                                  countdowning.value = false;
                                }
                                // モーダルを開く
                                if (context.mounted) {
                                  showModalBottomSheet(
                                    context: context,
                                    enableDrag: false,
                                    isScrollControlled: true,
                                    useSafeArea: true,
                                    builder: (context) => const TimerModal(),
                                  );
                                }
                              },
                        child: Text(
                          l10n.start_pomodoro,
                          style: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
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
      // モーダル初回表示時にポモドーロ開始
      if (!timerState.isRunning) {
        Future.microtask(() {
          ref.read(timerControllerProvider.notifier).startPomodoro();
        });
      }
      return null;
    }, []);

    return PopScope(
      canPop: !timerState.isRunning,
      child: Scaffold(
        body: Stack(
          children: [
            switch (timerState.status) {
              PomodoroStatus.work => const _WorkingWidget(),
              PomodoroStatus.rest => const _RestWidget(),
              PomodoroStatus.completed => const _CompletedWidget(),
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
                            .stopPomodoro();
                        Navigator.of(context).pop();
                      });
                    },
                  );
                } else {
                  Navigator.of(context).pop();
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
            // 時間表示をPomodoroCircleの外に移動
            Text(
              _formatTime(timerState.currentDurationTime),
              style: const TextStyle(
                fontSize: 92,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),
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

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
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
            // 時間表示をPomodoroCircleの外に移動
            Text(
              _formatTime(timerState.currentDurationTime),
              style: const TextStyle(
                fontSize: 92,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 32),
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

  String _formatTime(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

class _CompletedWidget extends ConsumerWidget {
  const _CompletedWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = ref.watch(l10nProvider);

    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              l10n.pomodoro_completed_title,
              style: const TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Icon(Icons.emoji_events, color: Colors.amber[700], size: 80),
            const SizedBox(height: 16),
            Text(
              l10n.pomodoro_completed_message,
              style: const TextStyle(
                fontSize: 22,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // タイマー状態を初期化
                ref.read(timerControllerProvider.notifier).reset();
                Navigator.of(context).pop();
              },
              child: Text(
                l10n.close,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
    final l10n = ref.watch(l10nProvider);

    // ステータスによって色を切り替え
    final isWork = state.status == PomodoroStatus.work;
    final List<Color> gradientColors = isWork
        ? [const Color(0xFFE57373), const Color(0xFFFFB74D)]
        : [const Color(0xFF4DD0E1), const Color(0xFF81C784)];

    final bgColor = isWork ? const Color(0xFFFFEBEE) : const Color(0xFFE0F7FA);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(120),
        child: Container(
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // 背景サークル（グラデーションなし、単色）
              SizedBox(
                width: 200,
                height: 200,
                child: CircularProgressIndicator(
                  value: 1.0,
                  strokeWidth: 40,
                  backgroundColor: Colors.transparent,
                  color: bgColor,
                ),
              ),
              // グラデーション進捗
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  final List<Color> sweepColors = [
                    ...gradientColors,
                    gradientColors.first
                  ];
                  return SweepGradient(
                    startAngle: 0,
                    endAngle: 2 * math.pi,
                    colors: sweepColors,
                    transform: const GradientRotation(-math.pi / 2),
                  ).createShader(bounds);
                },
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: CircularProgressIndicator(
                    value: 1 -
                        state.currentDurationTime.inSeconds /
                            state.initalDurationTime.inSeconds,
                    strokeWidth: 40,
                    backgroundColor: Colors.transparent,
                    color: Colors.white,
                  ),
                ),
              ),
              // 円の中にL10n対応の作業/休憩テキストとサイクル数
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    isWork ? l10n.working_phase : l10n.resting_phase,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${state.completedPomodoros} / ${state.maxPomodoros}',
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
}

// サウンドON/OFFスイッチWidget
class _SoundSwitch extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // SoundSettingState型に対応
    final soundSetting = ref.watch(soundSettingProvider);
    final soundNotifier = ref.read(soundSettingProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          soundSetting.soundOn ? Icons.volume_up : Icons.volume_off,
          color: Colors.black87,
        ),
        const SizedBox(width: 8),
        Text(
          soundSetting.soundOn ? 'サウンドON' : 'サウンドOFF',
          style: const TextStyle(fontSize: 18, color: Colors.black87),
        ),
        const SizedBox(width: 8),
        Switch(
          value: soundSetting.soundOn,
          onChanged: (v) => soundNotifier.setSoundOn(v),
          activeColor: Colors.black,
        ),
      ],
    );
  }
}
