import 'package:easy_localization/easy_localization.dart';
import 'package:github_repositories/domain/entities/owner_entity.dart';
import 'package:github_repositories/domain/usecases/do_auth_usecase.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';
import 'package:mobx/mobx.dart';
import '../../../data/datasources/secure_local_datasource.dart';

part 'home_screen_state.g.dart';

class HomeScreenState = HomeScreenStateBase with _$HomeScreenState;

abstract class HomeScreenStateBase with Store {
  final DoAuthUseCase _authUseCase;
  final SecureLocalDataSourceImpl _secureStorageUtil;
  HomeScreenStateBase(this._authUseCase, this._secureStorageUtil);

  final accessTokenRegexp = RegExp(r'^[a-zA-Z\d]{3}_[a-zA-Z\d]{36}$');

  @observable
  String accessToken = '';
  @observable
  String? accessTokenErrorMessage;
  @observable
  bool isAccessTokenValidated = false;
  @observable
  OwnerEntity? owner;
  @observable
  bool isLoading = false;
  @observable
  bool hasError = false;
  @observable
  String errorMessage = '';
  @observable
  String errorPrefix = '';
  @observable
  bool isLoaded = false;
  @observable

  @action
  validateAccessToken(String value) {
    if (value.isEmpty) {
      accessTokenErrorMessage = LocaleKeys.field_cannot_be_empty.tr();
      isAccessTokenValidated = true;
    } else if (!accessTokenRegexp.hasMatch(value)) {
      accessTokenErrorMessage = LocaleKeys.invalid_token.tr();
      isAccessTokenValidated = true;
    } else {
      isAccessTokenValidated = false;
      accessTokenErrorMessage = null;
    }
  }

  @action
  Future<void> auth() async {
    isLoading = true;
    final data = await _authUseCase.auth(accessToken: accessToken);
    owner = null;
    data.fold((failure) {
      isLoaded = false;
      hasError = true;
      errorMessage = failure.message ?? '';
      errorPrefix = failure.prefix ?? '';
    }, (owner) {
      saveAccessToken(accessToken);
      hasError = false;
      errorMessage = '';
      errorPrefix = '';
      isLoaded = true;
    });
    isLoading = false;
  }

  @action
  Future<void> saveAccessToken(String accessToken) async {
    _secureStorageUtil.saveAccessToken(accessToken: accessToken);
  }

  void validate() {
    validateAccessToken(accessToken);
  }
}
