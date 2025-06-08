import 'package:hooks_riverpod/hooks_riverpod.dart';

// Notifierを使ったサウンド設定管理
class SoundSettingController extends Notifier<bool> {
  @override
  bool build() {
    // デフォルトON
    return true;
  }

  void setSoundOn(bool value) {
    state = value;
    // TODO: 必要なら永続化処理を追加
  }
}

final soundSettingProvider =
    NotifierProvider<SoundSettingController, bool>(SoundSettingController.new);
