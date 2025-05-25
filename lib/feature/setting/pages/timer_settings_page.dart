import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/core/widgets/widget.dart';
import 'package:settings_ui/settings_ui.dart';

import '../controllers/controller.dart';

class TimerSettingsPage extends HookConsumerWidget {
  const TimerSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timerSettingsControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('タイマー設定'),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (context.mounted) {
                ref
                    .read(timerSettingsControllerProvider.notifier)
                    .saveSettings()
                    .then((_) => Navigator.pop(context));
              }
            },
          ),
        ],
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
//            title: const Text('ポモドーロタイマー'),
            tiles: [
              SettingsTile(
                title: const Text('作業時間'),
                value: Text('${state.workingDuration.inMinutes}分'),
                onPressed: (context) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => TimerSelectPicker(
                          initialMinutes: state.workingDuration.inMinutes,
                          endMinutes: 25,
                          onMinutesChanged: (minutes) {
                            ref
                                .read(timerSettingsControllerProvider.notifier)
                                .updateWorkingDuration(
                                    Duration(minutes: minutes));
                          }));
                },
              ),
              SettingsTile(
                title: const Text('休憩時間'),
                value: const Text('5分'),
                onPressed: (context) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => TimerSelectPicker(
                          initialMinutes: state.breakDuration.inMinutes,
                          endMinutes: 5,
                          onMinutesChanged: (minutes) {
                            ref
                                .read(timerSettingsControllerProvider.notifier)
                                .updateWorkingDuration(
                                    Duration(minutes: minutes));
                          }));
                },
              ),
              SettingsTile(
                title: const Text('フェーズ数'),
                value: const Text('4回'),
                onPressed: (context) {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) => CountSelectPicker(
                          initialCount: state.phaseCount,
                          startCount: 1,
                          endCount: 10,
                          onCountChanged: (count) {
                            ref
                                .read(timerSettingsControllerProvider.notifier)
                                .updatePhaseCount(count);
                          }));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
