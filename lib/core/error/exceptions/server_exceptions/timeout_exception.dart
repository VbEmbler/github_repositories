import 'package:easy_localization/easy_localization.dart';
import 'package:github_repositories/core/error/exceptions/server_exceptions/server_exception.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';

class TimeoutException extends ServerException {
  TimeoutException({int? statusCode, String? message, String? prefix})
      : super(
      statusCode: statusCode,
      message: message,
      prefix: LocaleKeys.request_timeout.tr());
}