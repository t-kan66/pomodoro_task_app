import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:go_router/go_router.dart';

import '../../../core/controllers/controller.dart';
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
          // アカウント管理セクションを追加
          SettingsSection(
            title: const Text('アカウント'),
            tiles: [
              SettingsTile(
                title: const Text('ログアウト', style: TextStyle(color: Colors.red)),
                leading: const Icon(Icons.logout, color: Colors.red),
                onPressed: (context) async {
                  // ログアウト確認ダイアログを表示
                  final shouldLogout = await showDialog<bool>(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('ログアウト'),
                      content: const Text('ログアウトしますか？'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text('キャンセル'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                          ),
                          child: const Text('ログアウト'),
                        ),
                      ],
                    ),
                  );

                  if (shouldLogout == true && context.mounted) {
                    try {
                      await ref.read(authControllerProvider.notifier).logout();
                      
                      if (context.mounted) {
                        // ログアウト後はログイン画面にリダイレクト
                        context.go('/login');
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('ログアウトに失敗しました: $e')),
                        );
                      }
                    }
                  }
                },
              ),
            ],
          ),
          // デバッグセクション（本番環境では削除推奨）
          SettingsSection(
            title: const Text('デバッグ (開発用)'),
            tiles: [
              SettingsTile.switchTile(
                initialValue: ref.watch(authControllerProvider).when(
                  data: (authState) => authState.status == AuthStatus.authenticated,
                  loading: () => false,
                  error: (error, stack) => false,
                ),
                onToggle: (isLoggedIn) async {
                  try {
                    await ref.read(authControllerProvider.notifier).setLoginStatus(isLoggedIn);
                    
                    // 状態を更新
                    ref.read(routeRedirectControllerProvider.notifier).refresh();
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('状態変更に失敗: $e')),
                      );
                    }
                  }
                },
                title: const Text('ログイン状態'),
                leading: const Icon(Icons.account_circle),
              ),
              SettingsTile(
                title: const Text('リダイレクト状態をリフレッシュ'),
                leading: const Icon(Icons.refresh),
                onPressed: (context) {
                  ref.read(routeRedirectControllerProvider.notifier).refresh();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('状態をリフレッシュしました')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
