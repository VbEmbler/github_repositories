// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenState on HomeScreenStateBase, Store {
  late final _$accessTokenAtom =
      Atom(name: 'HomeScreenStateBase.accessToken', context: context);

  @override
  String get accessToken {
    _$accessTokenAtom.reportRead();
    return super.accessToken;
  }

  @override
  set accessToken(String value) {
    _$accessTokenAtom.reportWrite(value, super.accessToken, () {
      super.accessToken = value;
    });
  }

  late final _$accessTokenErrorMessageAtom = Atom(
      name: 'HomeScreenStateBase.accessTokenErrorMessage', context: context);

  @override
  String? get accessTokenErrorMessage {
    _$accessTokenErrorMessageAtom.reportRead();
    return super.accessTokenErrorMessage;
  }

  @override
  set accessTokenErrorMessage(String? value) {
    _$accessTokenErrorMessageAtom
        .reportWrite(value, super.accessTokenErrorMessage, () {
      super.accessTokenErrorMessage = value;
    });
  }

  late final _$isAccessTokenValidatedAtom = Atom(
      name: 'HomeScreenStateBase.isAccessTokenValidated', context: context);

  @override
  bool get isAccessTokenValidated {
    _$isAccessTokenValidatedAtom.reportRead();
    return super.isAccessTokenValidated;
  }

  @override
  set isAccessTokenValidated(bool value) {
    _$isAccessTokenValidatedAtom
        .reportWrite(value, super.isAccessTokenValidated, () {
      super.isAccessTokenValidated = value;
    });
  }

  late final _$ownerAtom =
      Atom(name: 'HomeScreenStateBase.owner', context: context);

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
      Atom(name: 'HomeScreenStateBase.isLoading', context: context);

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
      Atom(name: 'HomeScreenStateBase.hasError', context: context);

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
      Atom(name: 'HomeScreenStateBase.errorMessage', context: context);

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
      Atom(name: 'HomeScreenStateBase.errorPrefix', context: context);

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
      Atom(name: 'HomeScreenStateBase.isLoaded', context: context);

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

  late final _$authAsyncAction =
      AsyncAction('HomeScreenStateBase.auth', context: context);

  @override
  Future<void> auth() {
    return _$authAsyncAction.run(() => super.auth());
  }

  late final _$saveAccessTokenAsyncAction =
      AsyncAction('HomeScreenStateBase.saveAccessToken', context: context);

  @override
  Future<void> saveAccessToken(String accessToken) {
    return _$saveAccessTokenAsyncAction
        .run(() => super.saveAccessToken(accessToken));
  }

  late final _$HomeScreenStateBaseActionController =
      ActionController(name: 'HomeScreenStateBase', context: context);

  @override
  dynamic validateAccessToken(String value) {
    final _$actionInfo = _$HomeScreenStateBaseActionController.startAction(
        name: 'HomeScreenStateBase.validateAccessToken');
    try {
      return super.validateAccessToken(value);
    } finally {
      _$HomeScreenStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accessToken: ${accessToken},
accessTokenErrorMessage: ${accessTokenErrorMessage},
isAccessTokenValidated: ${isAccessTokenValidated},
owner: ${owner},
isLoading: ${isLoading},
hasError: ${hasError},
errorMessage: ${errorMessage},
errorPrefix: ${errorPrefix},
isLoaded: ${isLoaded}
    ''';
  }
}
