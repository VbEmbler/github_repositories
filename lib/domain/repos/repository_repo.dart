import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/domain/entities/repository_entity.dart';

abstract class RepositoryRepo {
  Future<Either<Failure, RepositoryEntity>> getRepository({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  });
}
