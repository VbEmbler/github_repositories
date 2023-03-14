import 'package:easy_localization/easy_localization.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';

class NetworkFailure extends Failure {
  NetworkFailure({int? statusCode, String? message, String? prefix})
      : super(
      message: LocaleKeys.check_your_internet_connection.tr(),
      prefix: LocaleKeys.connection_error.tr());
}