import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:github_repositories/core/error/failures/network_failure.dart';
import 'package:github_repositories/data/datasources/secure_local_datasource.dart';
import 'package:github_repositories/domain/entities/repository_entity.dart';
import 'package:github_repositories/domain/usecases/get_repository_readme_usecase.dart';
import 'package:github_repositories/domain/usecases/get_repository_usecase.dart';
import 'package:mobx/mobx.dart';

part 'repository_screen_state.g.dart';

class RepositoryScreenState = RepositoryScreenStateBase with _$RepositoryScreenState;

abstract class RepositoryScreenStateBase with Store {
  final GetRepositoryUseCase _getRepositoryUseCase;
  final GetRepositoryReadmeUseCase _getRepositoryReadmeUseCase;
  final SecureLocalDataSourceImpl _secureStorageUtil;

  RepositoryScreenStateBase(
      this._getRepositoryUseCase,
      this._getRepositoryReadmeUseCase,
      this._secureStorageUtil
      );

  //Repository
  @observable
  RepositoryEntity? repository;
  @observable
  bool isRepositoryLoading = false;
  @observable
  bool hasErrorRepository = false;
  @observable
  String errorMessageRepository = '';
  @observable
  String errorPrefixRepository = '';
  @observable
  bool isRepositoryLoaded = false;
  @observable

  //Readme
  @observable
  String? readmeContentInMarkdown;
  @observable
  bool isReadmeLoading = false;
  @observable
  bool hasErrorReadme = false;
  @observable
  String errorMessageReadme = '';
  @observable
  String errorPrefixReadme = '';
  @observable
  bool isReadmeLoaded = false;
  @observable
  Map<String, GlobalKey> markdownHeaders = {};

  //other
  @observable
  bool isConnectionError = false;

  String downloadPath = '';
  String mainUrl = '';

  @action
  Future<void> getRepository({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  }) async {
    isRepositoryLoading = true;
    hasErrorRepository = false;
    final data = await _getRepositoryUseCase.getRepository(
        accessToken: accessToken,
        ownerLogin: ownerLogin,
        repositoryName: repositoryName
    );
    data.fold((failure) {
      isRepositoryLoaded = false;
      hasErrorRepository = true;
      if (failure is NetworkFailure) {
        isConnectionError = true;
      } else {
        isConnectionError = false;
      }
      errorMessageRepository = failure.message ?? '';
      errorPrefixRepository = failure.prefix ?? '';
    }, (repositoryData) {
      repository = repositoryData;
      hasErrorRepository = false;
      errorMessageRepository = '';
      errorPrefixRepository = '';
      isRepositoryLoaded = true;
    });
    isRepositoryLoading = false;
  }

  @action
  Future<void> getRepositoryReadme({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  }) async {
    isReadmeLoading = true;
    hasErrorReadme = false;
    final data = await _getRepositoryReadmeUseCase.getRepositoryReadme(
        accessToken: accessToken,
        ownerLogin: ownerLogin,
        repositoryName: repositoryName
    );
    data.fold((failure) {
      if (failure.statusCode == 404) {
        hasErrorReadme = false;
      } else {
        hasErrorReadme = true;
      }
      isReadmeLoaded = false;
      if (failure is NetworkFailure) {
        isConnectionError = true;
      } else {
        isConnectionError = false;
      }
      errorMessageReadme = failure.message ?? '';
      errorPrefixReadme = failure.prefix ?? '';
    }, (readMe) {
      if (readMe.content != null && readMe.content != '') {
        reorganizeReadmeContentToMarkdown(readMe.content!);
        if (readMe.downloadUrl != null) {
          downloadPath = readMe.downloadUrl!.substring(0, readMe.downloadUrl!.length - 9);
        }
        if (readMe.htmlUrl != null) {
          mainUrl = readMe.htmlUrl!.substring(0, readMe.htmlUrl!.length - 9);
        }
      }

      hasErrorReadme = false;
      errorMessageReadme = '';
      errorPrefixReadme = '';
      isReadmeLoaded = true;
    });
    isReadmeLoading = false;
  }

  @action
  Future<void> deleteAccessToken() async {
    _secureStorageUtil.deleteAccessToken();
  }

  @action
  void reorganizeReadmeContentToMarkdown(String readmeContent) {
    readmeContentInMarkdown = utf8.decode(base64.decode(readmeContent.replaceAll('\n', '')));
  }

  @action
  void addHeaderToHeadersList(String text, GlobalKey key) {
    markdownHeaders.addAll({text: key});
  }
}
