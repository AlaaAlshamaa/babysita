import 'package:testgit/Code/bloc/code_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/*class MySharedPreferences {
  Future<dynamic> LS() async {
    final prefs = await SharedPreferences.getInstance();
  }

  MySharedPreferences._privateConstructor();

  static final MySharedPreferences instance =
      MySharedPreferences._privateConstructor();

  Future setStringValue(String key, String value) async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setString(key, value);
  }

  String getStringValue(String key)  {
    SharedPreferences myPrefs =  _SharedPreferences.getInstance();
    return myPrefs.getString(key) ?? "";
  }
}
*/

class MySharedPreferences {
  static SharedPreferences? _preferences;

  static const _keyphone = '00000000';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setphone(String phone) async =>
      await _preferences?.setString(_keyphone, phone);

  static String? getphone() => _preferences?.getString(_keyphone);
}
