import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/core/usecases/repository_usecase.dart';
import 'package:github_repositories/domain/entities/repository_entity.dart';
import 'package:github_repositories/domain/repos/repository_repo.dart';

class GetRepositoryUseCase extends RepositoryUseCase<RepositoryEntity, String>{
  final RepositoryRepo _repositoryRepo;

  GetRepositoryUseCase(this._repositoryRepo);

  @override
  Future<Either<Failure, RepositoryEntity>> getRepository({
    required String accessToken,
    required String ownerLogin,
    required  String repositoryName
  }) async {
    return await _repositoryRepo.getRepository(
        accessToken: accessToken,
        ownerLogin: ownerLogin,
        repositoryName: repositoryName
    );
  }
}