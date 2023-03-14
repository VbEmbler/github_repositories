import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const accessTokenConst = 'ACCESS_TOKEN';

class SecureStorageService {
  final FlutterSecureStorage secureStorage;

  SecureStorageService({required this.secureStorage});

  Future<void> saveAccessToken({required String accessToken}) async {
    await secureStorage.write(key: accessTokenConst, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    final String? accessToken = await secureStorage.read(key: accessTokenConst);
    return accessToken;
  }

  Future<void> deleteAccessToken() async {
    await secureStorage.delete(key: accessTokenConst);
  }
}

