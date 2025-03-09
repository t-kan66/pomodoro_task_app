import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../routers/main_router.dart';

class SettingsPage extends HookConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('設定'),
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('一般'),
            tiles: [
              SettingsTile(
                title: const Text('タイマー設定'),
                leading: const Icon(Icons.timer),
                onPressed: (context) => ref
                    .read(mainRouterProvider)
                    .push(TimerSettingPageRoute().location),
              ),
              SettingsTile(
                title: const Text('通知'),
                leading: const Icon(Icons.notifications),
                onPressed: (context) {
                  // 通知設定画面への遷移処理
                },
              ),
            ],
          ),
          SettingsSection(title: const Text('その他'), tiles: [
            SettingsTile(
              title: const Text('プライバシーポリシー'),
              leading: const Icon(Icons.language),
              onPressed: (context) {
                // 言語設定画面への遷移処理
              },
            ),
            SettingsTile(
              title: const Text('テーマ'),
              leading: const Icon(Icons.color_lens),
              onPressed: (context) {
                // テーマ設定画面への遷移処理
              },
            ),
          ]),
        ],
      ),
    );
  }
}



// class SettingsTopPage extends HookConsumerWidget {
//   const SettingsTopPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final settingsState = ref.watch(settingsNotifierProvider);

//     // 初回生成時、UI更新時以外にATTのリクエストを行う。
//     // 戻り値としてnullを返却する。
//     useEffect(() {
//       WidgetsBinding.instance.addPostFrameCallback((_) {
// //        ref.read(settingsNotifierProvider.notifier).requestATT();
//       });
//       return null;
//     });

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(L10n.of(context)!.settings_title),
//       ),
//       body: SettingsList(sections: [
//         SettingsSection(
//           title: Text(L10n.of(context)!.setting_page_section_smile_detection),
//           tiles: [
//             SettingsTile.switchTile(
//                 initialValue: settingsState.smilePhotoEnable,
//                 onToggle: (value) {
//                   ref
//                       .read(settingsNotifierProvider.notifier)
//                       .toggleSmilePhotoEnable(value);
//                 },
//                 title: Text(
//                     L10n.of(context)!.setting_page_row_smile_detection_active)),
//             // 自動撮影の時間感覚
//             SettingsTile.navigation(
//               title: Row(
//                 children: [
//                   Text(
//                       L10n.of(context)!.setting_page_row_take_picture_interval),
//                   const Spacer(),
//                   Text("${settingsState.takePictureFrequency} sec"),
//                 ],
//               ),
//               onPressed: (context) => _showTakePictureFrequencyPicker(
//                   context, ref, settingsState.takePictureFrequency),
//             ),
//             // 笑顔検出率の設定

//             SettingsTile.navigation(
//               title: Row(
//                 children: [
//                   Text(L10n.of(context)!
//                       .setting_page_row_smile_detection_setting_detail),
//                   const Spacer(),
//                   Text("${(settingsState.smilePropThreshold * 100).toInt()}%"),
//                 ],
//               ),
//               onPressed: (context) => _showSmilePropThreadholdPicker(
//                   context, ref, settingsState.smilePropThreshold),
//             ),
//             SettingsTile.switchTile(
//                 initialValue: settingsState.openEyesEnable,
//                 onToggle: (value) {
//                   ref
//                       .read(settingsNotifierProvider.notifier)
//                       .toggleOpenEyesEnable(value);
//                 },
//                 title:
//                     Text(L10n.of(context)!.setting_page_row_open_eyes_active)),
//           ],
//         ),
//         const CustomSettingsSection(
//           child: SmilyAdWidget(position: AdBannerPosition.settingMiddle),
//         ),

//         SettingsSection(
//           title: Text(L10n.of(context)!.setting_page_section_review),
//           tiles: [
//             SettingsTile.navigation(
//               title: Text(L10n.of(context)!.setting_page_row_appstore_review),
//               onPressed: (context) {
//                 ref.read(settingsNotifierProvider.notifier).launchAppReview();
//               },
//             ),
//           ],
//         ),

//         // SettingSectionを定義する
//         // 内容は問い合わせフォームとアプリのレビュー
//         SettingsSection(
//           title: Text(L10n.of(context)!.setting_page_section_review),
//           tiles: [
//             SettingsTile.navigation(
//               title: Text(L10n.of(context)!.setting_page_row_contact_form),
//               onPressed: (context) {
//                 ref.read(routerProvider).push(AppRouter.contactFormPage);
//               },
//             ),
//           ],
//         ),
//         SettingsSection(
//           title: Text(L10n.of(context)!.setting_page_section_other),
//           tiles: [
//             SettingsTile.navigation(
//               title: Text(L10n.of(context)!.privacy_policy_page),
//               onPressed: (context) {
//                 ref.read(routerProvider).push(AppRouter.privacyPolicyPage);
//               },
//             ),
//             SettingsTile.navigation(
//               title: Text(L10n.of(context)!.setting_page_row_license),
//               onPressed: (context) {
//                 showLicensePage(context: context);
//               },
//             ),
//             SettingsTile.navigation(
//               title: Text(L10n.of(context)!.setting_page_row_version),
//               trailing: Text(settingsState.packageInfo?.version ?? '1.0.0'),
//             ),
//           ],
//         )
//       ]),
//     );
//   }

//   _showSmilePropThreadholdPicker(
//       BuildContext context, WidgetRef ref, double initValue) {
//     Picker(
//         cancelText: L10n.of(context)!.common_close,
//         confirmText: L10n.of(context)!.common_save,
//         adapter: NumberPickerAdapter(data: [
//           NumberPickerColumn(
//               begin: 0,
//               end: 100,
//               initValue: (initValue * 100).toInt(),
//               jump: 10),
//         ]),
//         hideHeader: true,
//         title: Text(
//             L10n.of(context)!.setting_page_row_smile_detection_setting_detail),
//         selectedTextStyle: const TextStyle(color: Colors.blue),
//         onConfirm: (Picker picker, List value) {
//           ref
//               .read(settingsNotifierProvider.notifier)
//               .saveSmilePropThreadhold(picker.getSelectedValues()[0] / 100);
//         }).showDialog(context);
//   }

//   _showTakePictureFrequencyPicker(
//       BuildContext context, WidgetRef ref, int initValue) {
//     Picker(
//         cancelText: L10n.of(context)!.common_close,
//         confirmText: L10n.of(context)!.common_save,
//         adapter: NumberPickerAdapter(data: [
//           NumberPickerColumn(
//             begin: 0,
//             end: 10,
//             initValue: initValue,
//           ),
//         ]),
//         hideHeader: true,
//         title: Text(L10n.of(context)!.setting_page_row_take_picture_interval),
//         selectedTextStyle: const TextStyle(color: Colors.blue),
//         onConfirm: (Picker picker, List value) {
//           ref
//               .read(settingsNotifierProvider.notifier)
//               .saveTakePictureFrequency(picker.getSelectedValues()[0]);
//         }).showDialog(context);
//   }
// }
