import 'package:izzat/app/shared/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPrefs {
  static SharedPreferences? _prefs;
  static Future init() async => _prefs = await SharedPreferences.getInstance();

  ///set

  static Future setName(String name) async =>
      await _prefs!.setString(prefsNamaUser, name);

  static Future setToken(String token) async =>
      await _prefs!.setString(prefsToken, token);

  ///get

  static String? getName() => _prefs?.getString(prefsNamaUser);

  static String? getToken() => _prefs?.getString(prefsToken);

  ///remove

}
