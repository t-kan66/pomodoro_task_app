import 'package:audioplayers/audioplayers.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class SoundManager {
  SoundManager();

  // AudioPlayerのインスタンス生成時にmode: PlayerMode.lowLatencyを指定するとSE用途でエラーが減ります
  final AudioPlayer _bgmPlayer = AudioPlayer();
  final AudioPlayer _sePlayer = AudioPlayer(
    playerId: 'se',
  );

  Future<void> playBgm(String assetPath, {bool loop = true}) async {
    await _bgmPlayer.stop();
    await _bgmPlayer.setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.stop);
    await _bgmPlayer.play(AssetSource(assetPath), volume: 1.0);
  }

  Future<void> stopBgm() async {
    await _bgmPlayer.stop();
  }

  Future<void> playSe(String assetPath) async {
    await _sePlayer.play(AssetSource(assetPath), volume: 1.0);
  }

  Future<void> stopSe() async {
    await _sePlayer.stop();
  }

  Future<void> setBgmVolume(double volume) async {
    await _bgmPlayer.setVolume(volume);
  }

  Future<void> setSeVolume(double volume) async {
    await _sePlayer.setVolume(volume);
  }
}

final soundManagerProvider = Provider<SoundManager>((ref) => SoundManager());
