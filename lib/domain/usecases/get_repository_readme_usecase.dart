import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/core/usecases/repository_readme_usecase.dart';
import 'package:github_repositories/domain/entities/repository_readme_entity.dart';
import 'package:github_repositories/domain/repos/repository_readme_repo.dart';

class GetRepositoryReadmeUseCase
    extends RepositoryReadmeUseCase<RepositoryReadmeEntity, String> {
  final RepositoryReadmeRepo _repositoryReadmeRepo;
  GetRepositoryReadmeUseCase(this._repositoryReadmeRepo);

  @override
  Future<Either<Failure, RepositoryReadmeEntity>> getRepositoryReadme({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  }) async {
    return await _repositoryReadmeRepo.getRepositoryReadme(
        accessToken: accessToken,
        ownerLogin: ownerLogin,
        repositoryName: repositoryName);
  }
}
