import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/controller.dart';
import '../data_stores/remote_config_data_store.dart';

final updateRepositoryProvider = Provider<UpdateRepository>((ref) {
  final dataStore = ref.watch(remoteConfigDataStoreProvider);
  return UpdateRepositoryImpl(dataStore);
});

abstract class UpdateRepository {
  Future<UpdateInfo> fetchUpdateInfo();
}

class UpdateRepositoryImpl implements UpdateRepository {
  final RemoteConfigDataStore dataStore;
  UpdateRepositoryImpl(this.dataStore);

  @override
  Future<UpdateInfo> fetchUpdateInfo() async {
    return await dataStore.fetchUpdateInfo();
  }
}
