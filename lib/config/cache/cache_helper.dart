import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;
  static const _storge = FlutterSecureStorage();
  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // set data
  static Future<void> set({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      await _prefs.setString(key, value);
    } else if (value is int) {
      await _prefs.setInt(key, value);
    } else if (value is bool) {
      await _prefs.setBool(key, value);
    } else if (value is double) {
      await _prefs.setDouble(key, value);
    } else if (value is List<String>) {
      await _prefs.setStringList(key, value);
    } else {
      throw UnsupportedError('Type not supported');
    }
  }

  // get data
  static String? getString({required String key}) {
    return _prefs.getString(key);
  }

  static bool? bogetBool({required String key}) {
    return _prefs.getBool(key);
  }

  static int? getInt({required String key}) {
    return _prefs.getInt(key);
  }

  static double? getDouble({required String key}) {
    return _prefs.getDouble(key);
  }

  static List<String>? getStringList({required String key}) {
    return _prefs.getStringList(key);
  }

  // remove data
  static Future<bool> delete({required String key}) {
    return _prefs.remove(key);
  }

  static Future<bool> clearallData({required String key}) {
    return _prefs.clear();
  }

  static Future<void> setSecureData({
    required String key,
    required String value,
  }) async {
    await _storge.write(key: key, value: value);
  }

  static Future<String?> getSecureData({required String key}) async {
    return await _storge.read(key: key);  
  }

  static Future<void> deleteSecureData({required String key}) async {
    await _storge.delete(key: key);
  }

  static Future<void> deleteAllSecureData() async {
    await _storge.deleteAll();
  }
}
