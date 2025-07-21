import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../controllers/controller.dart';
import '../repositories/repositories.dart';

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
