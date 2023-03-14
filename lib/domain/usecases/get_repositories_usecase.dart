import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/core/usecases/repositories_usecase.dart';
import 'package:github_repositories/domain/entities/repository_entity.dart';
import 'package:github_repositories/domain/repos/repositories_repo.dart';

class GetRepositoriesUseCase extends RepositoriesUseCase<RepositoryEntity, String>{
  final RepositoriesRepo _repositoriesRepo;

  GetRepositoriesUseCase(this._repositoriesRepo);

  @override
  Future<Either<Failure, List<RepositoryEntity>>> getRepositories({required String accessToken}) async {
    return await _repositoriesRepo.getRepositories(accessToken: accessToken);
  }
}
