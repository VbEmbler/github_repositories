import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:github_repositories/core/error/failures/network_failure.dart';
import 'package:github_repositories/data/datasources/secure_local_datasource.dart';
import 'package:github_repositories/domain/entities/owner_entity.dart';
import 'package:github_repositories/domain/entities/repository_entity.dart';
import 'package:github_repositories/domain/usecases/get_repositories_usecase.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';
import 'package:mobx/mobx.dart';

part 'repositories_screen_state.g.dart';

class RepositoriesScreenState = RepositoriesScreenStateBase
    with _$RepositoriesScreenState;

abstract class RepositoriesScreenStateBase with Store {
  final GetRepositoriesUseCase _getRepositoriesUseCase;
  final SecureLocalDataSourceImpl _secureStorageUtil;

  RepositoriesScreenStateBase(this._getRepositoriesUseCase, this._secureStorageUtil);

  @observable
  List<RepositoryEntity>? repositories;
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
  bool isConnectionError = false;
  @observable
  bool hasRepositories = true;

  Map? colorsMap;

  @action
  Future<void> getRepositories({required String accessToken}) async {
    isLoading = true;
    hasError = false;

    final data =
        await _getRepositoriesUseCase.getRepositories(accessToken: accessToken);
    owner = null;
    data.fold((failure) {
      isLoaded = false;
      hasError = true;
      if (failure is NetworkFailure) {
        isConnectionError = true;
      } else {
        isConnectionError = false;
      }
      hasRepositories = true;
      errorMessage = failure.message ?? '';
      errorPrefix = failure.prefix ?? '';
    }, (listRepository) {
      if (listRepository.isEmpty) {
        hasRepositories = false;
        hasError = true;
        errorPrefix = LocaleKeys.empty.tr();
        errorMessage = LocaleKeys.no_repositories_at_the_moment.tr();
        isLoaded = true;
      } else {
        repositories = listRepository;
        owner = listRepository[0].owner;
        hasRepositories = true;
        hasError = false;
        errorMessage = '';
        errorPrefix = '';
        isLoaded = true;
      }
    });
    isLoading = false;
  }

  @action
  Future<void> deleteAccessToken() async {
    _secureStorageUtil.deleteAccessToken();
  }

  Future<void> setColorsMap() async {
    try {
      final String responseLocal = await rootBundle.loadString(
          'assets/json/language_color.json'
      );
      final data = await json.decode(responseLocal);
      colorsMap = data;
    } catch (e) {
      colorsMap = null;
    }
  }

  Color? getColorByLanguage({required String language}) {
    Color? color;
    if (colorsMap != null && language != '') {
      colorsMap!.forEach((key, value) {
        if (key == language) {
          String colorHexString = value['color'];
          int colorInt = int.parse(colorHexString.replaceFirst('#', '0xFF'));
          color = Color(colorInt);
        }
      });
    }
    return color;
  }
}
