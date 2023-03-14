import 'package:github_repositories/domain/state/repository/repository_screen_state.dart';
import 'package:github_repositories/internal/dependencies/secure_local_datasource_module.dart';
import 'package:github_repositories/internal/dependencies/usecases/get_repository_readme_usecase_module.dart';
import 'package:github_repositories/internal/dependencies/usecases/get_repository_usecase_module.dart';

class RepositoryScreenModule {
  static RepositoryScreenState repositoryScreenState() {
    return RepositoryScreenState(
        GetRepositoryUseCaseModule.getRepositoryUseCase(),
        GetRepositoryReadmeUseCaseModule.getRepositoryReadmeUseCase(),
        SecureLocalDataSourceModule.secureLocalDataSourceImpl()
    );
  }
}