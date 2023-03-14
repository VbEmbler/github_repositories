import 'package:github_repositories/data/datasources/secure_storage_service.dart';

abstract class SecureLocalDataSource {
  Future<String?> getAccessToken();
  Future<void> saveAccessToken({required String accessToken});
  Future<void> deleteAccessToken();
}

class SecureLocalDataSourceImpl implements SecureLocalDataSource {
  final SecureStorageService secureStorageService;

  SecureLocalDataSourceImpl({required this.secureStorageService});

  @override
  Future<String?> getAccessToken() async {
    final String? accessToken = await secureStorageService.getAccessToken();
    return accessToken;
  }

  @override
  Future<void> saveAccessToken({required String accessToken}) async {
    await secureStorageService.saveAccessToken(accessToken: accessToken);
  }

  @override
  Future<void> deleteAccessToken() async {
    await secureStorageService.deleteAccessToken();
  }
}
