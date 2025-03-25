// shared preference のdata store
import 'package:shared_preferences/shared_preferences.dart';

// preference名を列挙
class PreferenceKeys {
  static const String workDuration = 'work_duration'; // 作業時間
  static const String breakDuration = 'break_duration'; // 休憩時間
  static const String phaseCount = 'phase_count'; // フェーズ数
}

class SharedPreferenceDataStore {
  final SharedPreferences _sharedPreferences;

  SharedPreferenceDataStore(this._sharedPreferences);

  // SharedPreferenceを取得
  String setTimerSetting(String keyString) {
    return _sharedPreferences.getString('user_name') ?? '';
  }

  // ユーザー名を保存
  Future<void> setUserName(String userName) async {
    await _sharedPreferences.setString('user_name', userName);
  }
}
