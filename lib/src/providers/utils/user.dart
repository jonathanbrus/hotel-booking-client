import 'package:shared_preferences/shared_preferences.dart';

Future<bool> userExist() async {
  final _prefs = await SharedPreferences.getInstance();
  _prefs.reload();
  return _prefs.containsKey("name");
}

Future<dynamic> setUserData(String key, dynamic value) async {
  final _prefs = await SharedPreferences.getInstance();
  _prefs.reload();
  _prefs.setString(key, "$value");
  return value;
}

Future<dynamic> getUserData(String key) async {
  final _prefs = await SharedPreferences.getInstance();
  _prefs.reload();
  return _prefs.getString(key);
}
