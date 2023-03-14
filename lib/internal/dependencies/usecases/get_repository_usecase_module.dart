import 'package:github_repositories/domain/usecases/get_repository_usecase.dart';
import 'package:github_repositories/internal/dependencies/repo_module.dart';

class GetRepositoryUseCaseModule {
  static GetRepositoryUseCase? _getRepositoryUseCase;
  
  static GetRepositoryUseCase getRepositoryUseCase() {
    _getRepositoryUseCase ??= GetRepositoryUseCase(RepoModule.repositoryRepoModule());
    return _getRepositoryUseCase!;
  }
}