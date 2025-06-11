import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/update_controller.dart';

abstract class RemoteConfigDataStore {
  Future<UpdateInfo> fetchUpdateInfo();
}

class RemoteConfigDataStoreImpl implements RemoteConfigDataStore {
  final FirebaseRemoteConfig remoteConfig;
  RemoteConfigDataStoreImpl(this.remoteConfig);

  @override
  Future<UpdateInfo> fetchUpdateInfo() async {
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
  }
}

final remoteConfigDataStoreProvider = Provider<RemoteConfigDataStore>((ref) {
  final remoteConfig = FirebaseRemoteConfig.instance;
  return RemoteConfigDataStoreImpl(remoteConfig);
});
