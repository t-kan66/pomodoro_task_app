import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/controller.dart';

abstract class RemoteConfigDataStore {
  Future<UpdateInfo> fetchUpdateInfo();
}

class RemoteConfigDataStoreImpl implements RemoteConfigDataStore {
  final FirebaseRemoteConfig remoteConfig;
  RemoteConfigDataStoreImpl(this.remoteConfig);

  @override
  Future<UpdateInfo> fetchUpdateInfo() async {
    try {
      // デフォルト値を設定
      await remoteConfig.setDefaults({
        'update_type': 0, // 0: アップデートなし, 1: 任意アップデート, 2: 強制アップデート
        'latest_version': '1.0.0',
        'update_message': 'アプリが最新バージョンです',
        'store_url': 'https://play.google.com/store/apps', // デフォルトのストアURL
      });

      // Remote Configの値を取得
      await remoteConfig.fetchAndActivate();
      
      final updateType = remoteConfig.getInt('update_type');
      final latestVersion = remoteConfig.getString('latest_version');
      final message = remoteConfig.getString('update_message');
      final storeUrl = remoteConfig.getString('store_url');
      
      return UpdateInfo(
        updateType: updateType,
        latestVersion: latestVersion,
        message: message,
        storeUrl: storeUrl,
      );
    } catch (e) {
      // Remote Configの取得に失敗した場合のフォールバック
      return const UpdateInfo(
        updateType: 0, // アップデートなし
        latestVersion: '1.0.0',
        message: 'アプリが最新バージョンです',
        storeUrl: 'https://play.google.com/store/apps',
      );
    }
  }
}

final remoteConfigDataStoreProvider = Provider<RemoteConfigDataStore>((ref) {
  final remoteConfig = FirebaseRemoteConfig.instance;
  return RemoteConfigDataStoreImpl(remoteConfig);
});
