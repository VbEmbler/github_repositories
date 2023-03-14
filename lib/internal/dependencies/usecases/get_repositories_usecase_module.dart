import 'package:github_repositories/domain/usecases/get_repositories_usecase.dart';
import 'package:github_repositories/internal/dependencies/repo_module.dart';

class GetRepositoriesUseCaseModule {
  static GetRepositoriesUseCase? _getRepositoriesUseCase;

  static GetRepositoriesUseCase getRepositoriesUseCase() {
    _getRepositoriesUseCase ??= GetRepositoriesUseCase(RepoModule.repositoriesRepoModule());
    return _getRepositoriesUseCase!;
  }
}