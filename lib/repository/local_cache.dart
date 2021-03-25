import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Config get and put method to cache data using Shared Preferences
@singleton
class LocalCache {
  // Get value of a key
  Future<String?> getString(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<int?> getInt(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key);
  }

  // Create/ Update a Key, Value pair into cache
  Future<void> put(String key, dynamic value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    switch (value.runtimeType) {
      case int:
        prefs.setInt(key, value);
        break;
      case bool:
        prefs.setBool(key, value);
        break;
      case double:
        prefs.setDouble(key, value);
        break;
      case List:
        prefs.setStringList(key, value);
        break;
      case String:
      default:
        prefs.setString(key, value);
        break;
    }
  }

  // Remove a Key, Value pair from cache
  Future<void> remove(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  // Remove a list of Keys from cache
  Future<void> removeKeys(List<String> keys) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    keys.forEach((key) => prefs.remove(key));
  }

  Future<dynamic> clear() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  final keyUserToken = 'userToken';
  final keyTheme = 'theme';
}
