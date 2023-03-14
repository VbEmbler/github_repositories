import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';

abstract class RepositoryReadmeUseCase<RepositoryReadmeEntity, String> {
  Future<Either<Failure, RepositoryReadmeEntity>> getRepositoryReadme({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  })
  ;
}
