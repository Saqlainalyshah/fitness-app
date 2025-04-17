import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final faceIdProvider=StateProvider<bool>((ref)=>false);
final smsAuthenticatorProvider=StateProvider<bool>((ref)=>false);
final googleAuthenticatorProvider=StateProvider<bool>((ref)=>false);

class LocalDatabase {
  SharedPreferences? _sharedPreferences;

  /// Stores data in SharedPreferences
  Future<void> setData(String key, dynamic value) async {
    _sharedPreferences = await SharedPreferences.getInstance();

    if (value is String) {
      await _sharedPreferences?.setString(key, value);
    } else if (value is double) {
      await _sharedPreferences?.setDouble(key, value);

    } else if (value is int) {
      await _sharedPreferences?.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferences?.setBool(key, value);
    }
    else {

      throw Exception("Unsupported data type");
    }
  }

  /// Retrieves data from SharedPreferences
  Future<dynamic> getData(String key) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return _sharedPreferences?.get(key);
  }
}

final localDatabaseProvider = Provider((ref) => LocalDatabase());

final isLandedProvider=StateProvider<bool>((ref)=>false);
