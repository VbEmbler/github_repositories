import 'package:github_repositories/domain/usecases/get_repository_readme_usecase.dart';
import 'package:github_repositories/internal/dependencies/repo_module.dart';

class GetRepositoryReadmeUseCaseModule {
  static GetRepositoryReadmeUseCase? _getRepositoryReadmeUseCase;

  static GetRepositoryReadmeUseCase getRepositoryReadmeUseCase() {
    _getRepositoryReadmeUseCase ??= GetRepositoryReadmeUseCase(RepoModule.repositoryReadmeRepoModule());
    return _getRepositoryReadmeUseCase!;
  }
}