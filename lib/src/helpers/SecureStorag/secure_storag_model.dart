import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:investment_assistant/src/helpers/SecureStorag/storage_keys.dart';

class SecureStoragModel {
  final _secureStorage = const FlutterSecureStorage();

  Future<String?> readLogin() async {
    final login = await _secureStorage.read(key: StorageKeys.login);
    return login;
  }

  Future<String?> readPassword() async {
    final password = await _secureStorage.read(key: StorageKeys.password);
    return password;
  }

  Future<String?> readToken() async {
    final key = await _secureStorage.read(key: StorageKeys.boxKey);
    return key;
  }

  Future<void> setLogin(String login) async {
    await _secureStorage.write(key: StorageKeys.login, value: login);
  }

  Future<void> setPassword(password) async {
    await _secureStorage.write(key: StorageKeys.password, value: password);
  }

  Future<void> setToken(boxKey) async {
    await _secureStorage.write(key: StorageKeys.boxKey, value: boxKey);
  }
}
