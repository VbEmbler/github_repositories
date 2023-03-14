import 'package:github_repositories/data/datasources/secure_local_datasource.dart';
import 'package:github_repositories/internal/dependencies/secure_storage_service_module.dart';

class SecureLocalDataSourceModule {
  static SecureLocalDataSourceImpl? _secureLocalDataSourceImpl;

  static SecureLocalDataSourceImpl secureLocalDataSourceImpl() {
    _secureLocalDataSourceImpl ??= SecureLocalDataSourceImpl(secureStorageService: SecureStorageServiceModule.secureStorageService());
    return _secureLocalDataSourceImpl!;
  }
}