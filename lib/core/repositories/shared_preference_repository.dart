import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/timer/controllers/controller.dart';

final sharedPreferenceRepositoryProvider =
    FutureProvider<SharedPreferenceRepository>(
  (ref) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return SharedPreferenceRepository(sharedPreferences);
  },
);

enum SharedPreferenceKey {
  timerSettings,
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
}
