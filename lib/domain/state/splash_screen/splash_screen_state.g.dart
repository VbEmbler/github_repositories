// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_screen_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashScreenState on SplashScreenStateBase, Store {
  late final _$accessTokenAtom =
      Atom(name: 'SplashScreenStateBase.accessToken', context: context);

  @override
  String? get accessToken {
    _$accessTokenAtom.reportRead();
    return super.accessToken;
  }

  @override
  set accessToken(String? value) {
    _$accessTokenAtom.reportWrite(value, super.accessToken, () {
      super.accessToken = value;
    });
  }

  late final _$getAccessTokenAsyncAction =
      AsyncAction('SplashScreenStateBase.getAccessToken', context: context);

  @override
  Future<void> getAccessToken() {
    return _$getAccessTokenAsyncAction.run(() => super.getAccessToken());
  }

  @override
  String toString() {
    return '''
accessToken: ${accessToken}
    ''';
  }
}
