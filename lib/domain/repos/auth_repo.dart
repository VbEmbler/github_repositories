import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/domain/entities/owner_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, OwnerEntity>> auth({required String accessToken});
}