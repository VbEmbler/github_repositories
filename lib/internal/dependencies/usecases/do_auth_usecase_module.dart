import 'package:github_repositories/domain/usecases/do_auth_usecase.dart';
import 'package:github_repositories/internal/dependencies/repo_module.dart';

class DoAuthUseCaseModule {
  static DoAuthUseCase? _doAuthUseCase;

  static DoAuthUseCase doAuthUseCase() {
    _doAuthUseCase ??= DoAuthUseCase(RepoModule.authRepoModule());
    return _doAuthUseCase!;
  }
}