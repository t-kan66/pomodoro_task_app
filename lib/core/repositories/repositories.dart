import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_stores/remote_config_data_store.dart';
export 'shared_preference_repository.dart';

final updateRepositoryProvider = Provider<UpdateRepository>((ref) {
  final dataStore = ref.watch(remoteConfigDataStoreProvider);
  return UpdateRepositoryImpl(dataStore);
});
