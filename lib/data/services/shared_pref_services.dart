import 'package:shared_preferences/shared_preferences.dart';

/// use `flutter_secure_storage` for sensitive data
/// for now we are using `shared_preferences` for simplicity

class SharedPrefServices {
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<bool> _setString(String key, String value) async => await _prefs!.setString(key, value);
  static String? _getString(String key) => _prefs!.getString(key);
  static Future<bool> _remove(String key) async => await _prefs!.remove(key);
  static Future<bool> clear() async => await _prefs!.clear();

  // set token
  static Future<void> setToken(String token) async => await _setString('token', token);

  // get token
  static String? getToken() => _getString('token');
  static Future<void> removeToken() async => _remove('token');

  // set id
  static Future<void> setUserID(String token) async => await _setString('userID', token);

  // get id
  static String? getUserID() => _getString('userID');
  static Future<void> removeUserID() async => _remove('userID');

  // helper
  static Future<void> setLoginCredential(String token, String userID) async {
    await setToken(token);
    await setUserID(userID);
  }

  // get both token and id
  static (String? userID, String? token) getIdAndToken() {
    final token = getToken();
    final userID = getUserID();
    return (userID, token);
  }

  static Future<void> removeLoginCredential() async {
    await removeToken();
    await removeUserID();
  }
}
