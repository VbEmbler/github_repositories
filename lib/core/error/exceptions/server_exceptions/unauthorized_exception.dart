import 'package:easy_localization/easy_localization.dart';
import 'package:github_repositories/core/error/exceptions/server_exceptions/server_exception.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';

class UnAuthorizedException extends ServerException {
  UnAuthorizedException({int? statusCode, String? message, String? prefix})
      : super(
      statusCode: statusCode,
      message: message,
      prefix: LocaleKeys.unauthorized_request.tr());
}