import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:github_repositories/data/datasources/secure_storage_service.dart';

class SecureStorageServiceModule {
  static SecureStorageService? _secureStorageService;

  static SecureStorageService secureStorageService() {
    _secureStorageService ??= SecureStorageService(secureStorage: const FlutterSecureStorage());
    return _secureStorageService!;
  }
}