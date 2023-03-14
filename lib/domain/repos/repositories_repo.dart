import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/domain/entities/repository_entity.dart';

abstract class RepositoriesRepo {
  Future<Either<Failure, List<RepositoryEntity>>> getRepositories({
    required String accessToken
  });
}