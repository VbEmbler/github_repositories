// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_screen_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RepositoriesScreenState on RepositoriesScreenStateBase, Store {
  late final _$repositoriesAtom =
      Atom(name: 'RepositoriesScreenStateBase.repositories', context: context);

  @override
  List<RepositoryEntity>? get repositories {
    _$repositoriesAtom.reportRead();
    return super.repositories;
  }

  @override
  set repositories(List<RepositoryEntity>? value) {
    _$repositoriesAtom.reportWrite(value, super.repositories, () {
      super.repositories = value;
    });
  }

  late final _$ownerAtom =
      Atom(name: 'RepositoriesScreenStateBase.owner', context: context);

  @override
  OwnerEntity? get owner {
    _$ownerAtom.reportRead();
    return super.owner;
  }

  @override
  set owner(OwnerEntity? value) {
    _$ownerAtom.reportWrite(value, super.owner, () {
      super.owner = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'RepositoriesScreenStateBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: 'RepositoriesScreenStateBase.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'RepositoriesScreenStateBase.errorMessage', context: context);

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$errorPrefixAtom =
      Atom(name: 'RepositoriesScreenStateBase.errorPrefix', context: context);

  @override
  String get errorPrefix {
    _$errorPrefixAtom.reportRead();
    return super.errorPrefix;
  }

  @override
  set errorPrefix(String value) {
    _$errorPrefixAtom.reportWrite(value, super.errorPrefix, () {
      super.errorPrefix = value;
    });
  }

  late final _$isLoadedAtom =
      Atom(name: 'RepositoriesScreenStateBase.isLoaded', context: context);

  @override
  bool get isLoaded {
    _$isLoadedAtom.reportRead();
    return super.isLoaded;
  }

  @override
  set isLoaded(bool value) {
    _$isLoadedAtom.reportWrite(value, super.isLoaded, () {
      super.isLoaded = value;
    });
  }

  late final _$isConnectionErrorAtom = Atom(
      name: 'RepositoriesScreenStateBase.isConnectionError', context: context);

  @override
  bool get isConnectionError {
    _$isConnectionErrorAtom.reportRead();
    return super.isConnectionError;
  }

  @override
  set isConnectionError(bool value) {
    _$isConnectionErrorAtom.reportWrite(value, super.isConnectionError, () {
      super.isConnectionError = value;
    });
  }

  late final _$hasRepositoriesAtom = Atom(
      name: 'RepositoriesScreenStateBase.hasRepositories', context: context);

  @override
  bool get hasRepositories {
    _$hasRepositoriesAtom.reportRead();
    return super.hasRepositories;
  }

  @override
  set hasRepositories(bool value) {
    _$hasRepositoriesAtom.reportWrite(value, super.hasRepositories, () {
      super.hasRepositories = value;
    });
  }

  late final _$getRepositoriesAsyncAction = AsyncAction(
      'RepositoriesScreenStateBase.getRepositories',
      context: context);

  @override
  Future<void> getRepositories({required String accessToken}) {
    return _$getRepositoriesAsyncAction
        .run(() => super.getRepositories(accessToken: accessToken));
  }

  late final _$deleteAccessTokenAsyncAction = AsyncAction(
      'RepositoriesScreenStateBase.deleteAccessToken',
      context: context);

  @override
  Future<void> deleteAccessToken() {
    return _$deleteAccessTokenAsyncAction.run(() => super.deleteAccessToken());
  }

  @override
  String toString() {
    return '''
repositories: ${repositories},
owner: ${owner},
isLoading: ${isLoading},
hasError: ${hasError},
errorMessage: ${errorMessage},
errorPrefix: ${errorPrefix},
isLoaded: ${isLoaded},
isConnectionError: ${isConnectionError},
hasRepositories: ${hasRepositories}
    ''';
  }
}
