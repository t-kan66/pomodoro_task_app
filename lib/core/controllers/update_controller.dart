import '../data_stores/remote_config_data_store.dart';
import '../repositories/update_repository.dart';
import '../usecases/fetch_update_info_usecase.dart';
import 'update_info.dart';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppUpdateController {
  final FetchUpdateInfoUsecase fetchUpdateInfoUsecase;
  AppUpdateController(this.fetchUpdateInfoUsecase);

  Future<UpdateInfo> getUpdateInfo() async {
    return await fetchUpdateInfoUsecase.execute();
  }
}

final appUpdateControllerProvider = Provider<AppUpdateController>((ref) {
  final usecase = ref.watch(fetchUpdateInfoUsecaseProvider);
  return AppUpdateController(usecase);
});

Future<UpdateInfo> fetchUpdateInfo(FirebaseRemoteConfig remoteConfig) async {
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