import 'package:github_repositories/core/error/failures/failure.dart';

class ResponseFailure extends Failure {
  ResponseFailure({int? statusCode, String? message, String? prefix})
      : super(statusCode: statusCode, message: message, prefix: prefix);
}