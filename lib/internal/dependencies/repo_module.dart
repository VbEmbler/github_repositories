import 'package:github_repositories/data/repos/auth_repo_impl.dart';
import 'package:github_repositories/data/repos/repositories_repo_impl.dart';
import 'package:github_repositories/data/repos/repository_readme_repo_impl.dart';
import 'package:github_repositories/data/repos/repository_repo_impl.dart';
import 'package:github_repositories/domain/repos/auth_repo.dart';
import 'package:github_repositories/domain/repos/repositories_repo.dart';
import 'package:github_repositories/domain/repos/repository_readme_repo.dart';
import 'package:github_repositories/domain/repos/repository_repo.dart';
import 'package:github_repositories/internal/dependencies/api_module.dart';
import 'package:github_repositories/internal/dependencies/network_info_module.dart';
import 'package:github_repositories/internal/dependencies/secure_local_datasource_module.dart';

class RepoModule {
  static AuthRepo? _authRepo;
  static RepositoriesRepo? _repositoriesRepo;
  static RepositoryRepo? _repositoryRepo;
  static RepositoryReadmeRepo? _repositoryReadmeRepo;

  static AuthRepo authRepoModule() {
    _authRepo ??= AuthRepoImpl(
        remoteDataSource: ApiModule.remoteDataSourceImpl(),
        secureLocalDataSource: SecureLocalDataSourceModule.secureLocalDataSourceImpl(),
        networkInfo: NetworkInfoModule.networkInfoImpl()
    );
    return _authRepo!;
  }

  static RepositoriesRepo repositoriesRepoModule() {
    _repositoriesRepo ??= RepositoriesRepoImpl(
        remoteDataSource: ApiModule.remoteDataSourceImpl(),
        accessTokenLocalDataSource: SecureLocalDataSourceModule.secureLocalDataSourceImpl(),
        networkInfo: NetworkInfoModule.networkInfoImpl()
    );
    return _repositoriesRepo!;
  }

  static RepositoryRepo repositoryRepoModule() {
    _repositoryRepo ??= RepositoryRepoImpl(
        remoteDataSource: ApiModule.remoteDataSourceImpl(),
        networkInfo: NetworkInfoModule.networkInfoImpl()
    );
    return _repositoryRepo!;
  }

  static RepositoryReadmeRepo repositoryReadmeRepoModule() {
    _repositoryReadmeRepo ??= RepositoryReadmeRepoImpl(
        remoteDataSource: ApiModule.remoteDataSourceImpl(),
        networkInfo: NetworkInfoModule.networkInfoImpl()
    );
    return _repositoryReadmeRepo!;
  }
}