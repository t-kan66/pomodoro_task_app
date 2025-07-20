import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/timer/controllers/controller.dart';
import '../controllers/controller.dart';

final sharedPreferenceRepositoryProvider =
    FutureProvider<SharedPreferenceRepository>(
  (ref) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return SharedPreferenceRepository(sharedPreferences);
  },
);

enum SharedPreferenceKey {
  timerSettings,
  soundSettings, // サウンド設定用キーを追加
}

class SharedPreferenceRepository {
  final SharedPreferences _sharedPreferences;

  SharedPreferenceRepository(this._sharedPreferences);

  // TimerSettingStateを取得
  TimerSettingState getTimerSettings() {
    final jsonString =
        _sharedPreferences.getString(SharedPreferenceKey.timerSettings.name);
    if (jsonString == null) {
      return const TimerSettingState(); // デフォルト値を返す
    }
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    return TimerSettingState.fromJson(jsonMap);
  }

  // TimerSettingStateを保存
  Future<void> setTimerSettings(TimerSettingState settings) async {
    final jsonString = json.encode(settings.toJson());
    await _sharedPreferences.setString(
      SharedPreferenceKey.timerSettings.name,
      jsonString,
    );
  }

  // サウンド設定を取得
  SoundSettingState getSoundSettings() {
    final jsonString =
        _sharedPreferences.getString(SharedPreferenceKey.soundSettings.name);
    if (jsonString == null) {
      // デフォルト値
      return SoundSettingState(
        soundOn: true,
        bgmAsset: 'sounds/bgm.mp3',
        seAsset: 'sounds/countdown.mp3',
      );
    }
    final jsonMap = json.decode(jsonString) as Map<String, dynamic>;
    return SoundSettingState(
      soundOn: jsonMap['soundOn'] as bool? ?? true,
      bgmAsset: jsonMap['bgmAsset'] as String? ?? 'sounds/bgm.mp3',
      seAsset: jsonMap['seAsset'] as String? ?? 'sounds/countdown.mp3',
    );
  }

  // サウンド設定を保存
  Future<void> setSoundSettings(SoundSettingState settings) async {
    final jsonString = json.encode({
      'soundOn': settings.soundOn,
      'bgmAsset': settings.bgmAsset,
      'seAsset': settings.seAsset,
    });
    await _sharedPreferences.setString(
      SharedPreferenceKey.soundSettings.name,
      jsonString,
    );
  }
}
