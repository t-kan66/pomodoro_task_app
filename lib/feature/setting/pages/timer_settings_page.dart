// ポモドーロタイマーの時間を設定するページを作成
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class TimerSettingsPage extends HookConsumerWidget {
  const TimerSettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タイマー設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('ポモドーロタイマー'),
            tiles: [
              SettingsTile(
                title: const Text('作業時間'),
                value: const Text('25分'),
                onPressed: (context) {
                  // 作業時間設定ダイアログを表示
                },
              ),
              SettingsTile(
                title: const Text('休憩時間'),
                value: const Text('5分'),
                onPressed: (context) {
                  // 休憩時間設定ダイアログを表示
                },
              ),
              SettingsTile(
                title: const Text('フェーズ数'),
                value: const Text('4回'),
                onPressed: (context) {
                  // 長い休憩時間設定ダイアログを表示
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
