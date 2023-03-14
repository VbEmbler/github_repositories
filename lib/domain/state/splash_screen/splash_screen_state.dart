import 'package:github_repositories/data/datasources/secure_local_datasource.dart';
import 'package:mobx/mobx.dart';

part 'splash_screen_state.g.dart';

class SplashScreenState = SplashScreenStateBase with _$SplashScreenState;

abstract class SplashScreenStateBase with Store {
  final SecureLocalDataSourceImpl _secureStorageUtil;

  SplashScreenStateBase(this._secureStorageUtil);

  @observable
  String? accessToken;

  @action
  Future<void> getAccessToken() async {
    accessToken = await _secureStorageUtil.getAccessToken();
  }
}