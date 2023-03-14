import 'package:github_repositories/domain/state/splash_screen/splash_screen_state.dart';
import 'package:github_repositories/internal/dependencies/secure_local_datasource_module.dart';

class SplashScreenModule {
  static SplashScreenState splashScreenState() {
    return SplashScreenState(
        SecureLocalDataSourceModule.secureLocalDataSourceImpl()
    );
  }
}