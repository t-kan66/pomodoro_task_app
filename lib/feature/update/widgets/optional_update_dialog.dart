import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/core/controllers/update_info.dart';
import 'package:url_launcher/url_launcher.dart';

class OptionalUpdateDialog extends StatelessWidget {
  final UpdateInfo updateInfo;
  
  const OptionalUpdateDialog({
    required this.updateInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Row(
        children: [
          Icon(
            Icons.system_update,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(width: 8),
          const Text('アップデートのお知らせ'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'バージョン ${updateInfo.latestVersion} が利用可能です',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(updateInfo.message),
          const SizedBox(height: 16),
          const Text(
            '※後でアップデートすることも可能です',
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('あとで'),
        ),
        ElevatedButton(
          onPressed: () async {
            final uri = Uri.parse(updateInfo.storeUrl);
            if (await canLaunchUrl(uri)) {
              await launchUrl(uri, mode: LaunchMode.externalApplication);
            }
            if (context.mounted) {
              Navigator.of(context).pop();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.white,
          ),
          child: const Text('アップデート'),
        ),
      ],
    );
  }

  static void show(BuildContext context, UpdateInfo updateInfo) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => OptionalUpdateDialog(updateInfo: updateInfo),
    );
  }
}
