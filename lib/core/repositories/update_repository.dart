import '../data_stores/remote_config_data_store.dart';
import '../controllers/update_controller.dart';

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
