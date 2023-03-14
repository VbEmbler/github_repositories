import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';

abstract class AuthUseCase<OwnerEntity, String> {
  Future<Either<Failure, OwnerEntity>> auth({required String accessToken});
}
