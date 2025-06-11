import '../../repositories/update_repository.dart';
import '../../data_stores/remote_config_data_store.dart';
import '../controllers/update_controller.dart';

class FetchUpdateInfoUsecase {
  final UpdateRepository repository;
  FetchUpdateInfoUsecase(this.repository);

  Future<UpdateInfo> execute() async {
    return await repository.fetchUpdateInfo();
  }
}


final fetchUpdateInfoUsecaseProvider = Provider<FetchUpdateInfoUsecase>((ref) {
  final repository = ref.watch(updateRepositoryProvider);
  return FetchUpdateInfoUsecase(repository);
});