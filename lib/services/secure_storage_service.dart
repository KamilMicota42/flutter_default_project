import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SecureStorageService {

  final _storage = const FlutterSecureStorage();
  final _iosOptions = const IOSOptions(accessibility: IOSAccessibility.first_unlock);

  final String _tokenKey = 'TOKEN_KEY';

  Future<SecureStorageService> init() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.getBool('first_run') ?? true) {
      FlutterSecureStorage storage = const FlutterSecureStorage();

      await storage.deleteAll();

      prefs.setBool('first_run', false);
    }
    return this;
  }

  Future<void> _write(String key, dynamic value) async {
    await _storage.write(key: key, value: value, iOptions: _iosOptions);
  }

  Future<String?> _read(String key) async {
    return await _storage.read(key: key, iOptions: _iosOptions);
  }

  Future<void> saveToken(String token) async {
    await _write(_tokenKey, token);
  }

  Future<String?> getToken() async {
    return await _read(_tokenKey);
  }
}
