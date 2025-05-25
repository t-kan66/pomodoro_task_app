// shared preference のdata store
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/feature/timer/controllers/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

// preference名を列挙
class PreferenceKeys {
  static const String workDuration = 'work_duration'; // 作業時間
  static const String breakDuration = 'break_duration'; // 休憩時間
  static const String phaseCount = 'phase_count'; // フェーズ数

  static const String timerSettings = 'timer_settings'; // タイマー設定
}

// SharedPreferencesのProviderを定義
final sharedPreferencesDataStoreProvider =
    FutureProvider<SharedPreferenceDataStore>((ref) async {
  return SharedPreferenceDataStore(await SharedPreferences.getInstance());
});

class SharedPreferenceDataStore {
  final SharedPreferences _sharedPreferences;

  SharedPreferenceDataStore(this._sharedPreferences);

  //timer Settingsを保存する
  Future<void> setTimerSettings(TimerSettingState value) async {
    final valueString = jsonEncode(value.toJson());
    await _sharedPreferences.setString(
        PreferenceKeys.timerSettings, valueString);
  }

  //timer Settingsを取得する
  TimerSettingState getTimerSettings() {
    final valueString =
        _sharedPreferences.getString(PreferenceKeys.timerSettings);
    if (valueString == null) {
      return const TimerSettingState();
    }
    final valueMap = jsonDecode(valueString);
    return TimerSettingState.fromJson(valueMap);
  }
}
