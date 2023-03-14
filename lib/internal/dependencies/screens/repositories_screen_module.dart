import 'package:github_repositories/domain/state/repositories/repositories_screen_state.dart';
import 'package:github_repositories/internal/dependencies/usecases/get_repositories_usecase_module.dart';
import 'package:github_repositories/internal/dependencies/secure_local_datasource_module.dart';

class RepositoriesScreenModule {
  static RepositoriesScreenState repositoriesScreenState() {
    return RepositoriesScreenState(
      GetRepositoriesUseCaseModule.getRepositoriesUseCase(),
      SecureLocalDataSourceModule.secureLocalDataSourceImpl()
    );
  }
}