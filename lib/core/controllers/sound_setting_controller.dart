import 'package:hooks_riverpod/hooks_riverpod.dart';

class SoundSettingState {
  final bool soundOn;
  final String bgmAsset; // BGMファイルパス
  final String seAsset;  // SEファイルパス

  SoundSettingState({
    required this.soundOn,
    required this.bgmAsset,
    required this.seAsset,
  });

  SoundSettingState copyWith({
    bool? soundOn,
    String? bgmAsset,
    String? seAsset,
  }) {
    return SoundSettingState(
      soundOn: soundOn ?? this.soundOn,
      bgmAsset: bgmAsset ?? this.bgmAsset,
      seAsset: seAsset ?? this.seAsset,
    );
  }
}

// Notifierを使ったサウンド設定管理
class SoundSettingController extends Notifier<SoundSettingState> {
  @override
  SoundSettingState build() {
    // デフォルトON、デフォルト音源
    return SoundSettingState(
      soundOn: true,
      bgmAsset: 'sounds/bgm.mp3',
      seAsset: 'sounds/countdown.mp3',
    );
  }

  void setSoundOn(bool value) {
    state = state.copyWith(soundOn: value);
    // TODO: 必要なら永続化処理を追加
  }

  void setBgmAsset(String assetPath) {
    state = state.copyWith(bgmAsset: assetPath);
    // TODO: 必要なら永続化処理を追加
  }

  void setSeAsset(String assetPath) {
    state = state.copyWith(seAsset: assetPath);
    // TODO: 必要なら永続化処理を追加
  }
}

final soundSettingProvider =
    NotifierProvider<SoundSettingController, SoundSettingState>(SoundSettingController.new);
