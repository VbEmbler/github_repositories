import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:github_repositories/core/error/exceptions/server_exceptions/server_exception.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/core/error/failures/network_failure.dart';
import 'package:github_repositories/core/error/failures/response_failure.dart';
import 'package:github_repositories/core/platform/network_info.dart';
import 'package:github_repositories/data/datasources/remote_datasource.dart';
import 'package:github_repositories/data/mappers/repository_mapper.dart';
import 'package:github_repositories/domain/entities/repository_entity.dart';
import 'package:github_repositories/domain/repos/repository_repo.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';

class RepositoryRepoImpl implements RepositoryRepo {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RepositoryRepoImpl({
    required this.remoteDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, RepositoryEntity>> getRepository(
      {required String accessToken,
      required String ownerLogin,
      required String repositoryName}) async {
    if (await networkInfo.isConnected) {
      try {
        final repositories = await remoteDataSource.getRepository(
            accessToken: accessToken,
            ownerLogin: ownerLogin,
            repositoryName: repositoryName
        );
        return Right(RepositoryMapper.repositoryFromApi(repositories));
      } on ServerException catch (error) {
        return Left(ResponseFailure(message: error.message, prefix: error.prefix));
      } on Exception catch (error) {
        return Left(ResponseFailure(
            message: '${error.toString()}. ${LocaleKeys.please_send_this_message_to_developer.tr()}',
            prefix:  LocaleKeys.error.tr()
        ));
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
