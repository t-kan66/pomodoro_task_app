import 'package:shared_preferences/shared_preferences.dart';

// shared preference のrepository
class SharedPreferenceRepository {
  final SharedPreferences _sharedPreferences;

  SharedPreferenceRepository(this._sharedPreferences);

  // ユーザー名を取得
  String getUserName() {
    return _sharedPreferences.getString('user_name') ?? '';
  }

  // ユーザー名を保存
  Future<void> setUserName(String userName) async {
    await _sharedPreferences.setString('user_name', userName);
  }
}