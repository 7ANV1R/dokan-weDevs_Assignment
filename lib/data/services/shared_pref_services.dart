import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefServices {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool> _setString(String key, String value) async => await _prefs!.setString(key, value);
  static String? _getString(String key) => _prefs!.getString(key);
  static Future<bool> _remove(String key) async => await _prefs!.remove(key);

  // set token
  static Future<void> setToken(String token) async => await _setString('token', token);

  // get token
  static String? getToken() => _getString('token');
  static Future<void> removeToken() async => _remove('token');
}
