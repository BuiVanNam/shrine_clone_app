import 'package:shared_preferences/shared_preferences.dart';

class LoginUtils {
  static String keyLogin = 'is_login';

  static Future<void> setLogin() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(keyLogin, true);
  }

  static Future<void> logout() async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(keyLogin, false);
  }

  static Future<bool> isLogin() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(keyLogin) ?? false;
  }
}
