import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';

abstract class RepositoryUseCase<RepositoryEntity, String> {
  Future<Either<Failure, RepositoryEntity>> getRepository({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  });
}