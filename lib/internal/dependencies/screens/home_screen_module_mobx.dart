import 'package:github_repositories/domain/state/auth/home_screen_state.dart';
import 'package:github_repositories/internal/dependencies/usecases/do_auth_usecase_module.dart';
import 'package:github_repositories/internal/dependencies/secure_local_datasource_module.dart';

class HomeScreenModuleMobX {
  static HomeScreenState homeScreenMobXState() {
    return HomeScreenState(
        DoAuthUseCaseModule.doAuthUseCase(),
        SecureLocalDataSourceModule.secureLocalDataSourceImpl()
    );
  }
}
