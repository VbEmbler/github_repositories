import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/domain/entities/repository_readme_entity.dart';

abstract class RepositoryReadmeRepo {
  Future<Either<Failure, RepositoryReadmeEntity>> getRepositoryReadme({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  });
}