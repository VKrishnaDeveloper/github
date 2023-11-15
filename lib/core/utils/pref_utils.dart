//ignore: unused_import
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  SharedPreferences? _preferences;

  PrefUtils._internal();

  static final PrefUtils _singleton = PrefUtils._internal();

  factory PrefUtils() {
    return _singleton;
  }

  init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  ///will clear all the data stored in preference
  Future<bool> clearPreferenceValues() async {
    return await _preferences?.clear() ?? false;
  }

  Future<bool> setStringValue(String key, String value) async {
    return await _preferences?.setString(key, value) ?? false;
  }

  Future<bool> setIntValue(String key, int value) async {
    return await _preferences?.setInt(key, value) ?? false;
  }

  Future<bool> setDoubleValue(String key, double value) async {
    return await _preferences?.setDouble(key, value) ?? false;
  }

  Future<bool> setBoolValue(String key, bool value) async {
    return await _preferences?.setBool(key, value) ?? false;
  }

  String? getStringValue(String key) {
    return _preferences?.getString(key);
  }

  bool getBoolValue(String key) {
    return _preferences?.getBool(key) ?? false;
  }

  int? getIntValue(String key) {
    return _preferences?.getInt(key);
  }

  double? getDoubleValue(String key) {
    return _preferences?.getDouble(key);
  }
}

class SharedPreferencesString {
  static const userIsSignedInKey = "user_isSignedIn";
  static const userSessionTimeOut = "user_session_time_out";
  static const givenName = "given_name";
  static const familyName = "family_name";
  static const userName = 'user_name';
  static const password = 'password';
  static const isFaceIdEnabled = 'is_face_auth_enbaled';
  static const stateName = 'stateName';
}
