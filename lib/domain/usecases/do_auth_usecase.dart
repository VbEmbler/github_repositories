import 'package:dartz/dartz.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/core/usecases/auth_usecase.dart';
import 'package:github_repositories/domain/entities/owner_entity.dart';
import 'package:github_repositories/domain/repos/auth_repo.dart';

class DoAuthUseCase extends AuthUseCase<OwnerEntity, String> {
  final AuthRepo _authRepo;

  DoAuthUseCase(this._authRepo);
  @override
  Future<Either<Failure, OwnerEntity>> auth({required String accessToken}) async {
    return await _authRepo.auth(accessToken: accessToken);
  }

}