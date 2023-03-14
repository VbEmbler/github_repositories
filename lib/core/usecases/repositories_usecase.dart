import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';

abstract class RepositoriesUseCase<RepositoryEntity, String> {
  Future<Either<Failure, List<RepositoryEntity>>> getRepositories({
      required String accessToken
  });
}
