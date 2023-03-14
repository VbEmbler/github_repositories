import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:github_repositories/core/error/exceptions/server_exceptions/server_exception.dart';
import 'package:github_repositories/core/error/failures/failure.dart';
import 'package:github_repositories/core/error/failures/network_failure.dart';
import 'package:github_repositories/core/error/failures/response_failure.dart';
import 'package:github_repositories/core/platform/network_info.dart';
import 'package:github_repositories/data/datasources/remote_datasource.dart';
import 'package:github_repositories/data/datasources/secure_local_datasource.dart';
import 'package:github_repositories/data/mappers/owner_mapper.dart';
import 'package:github_repositories/domain/entities/owner_entity.dart';
import 'package:github_repositories/domain/repos/auth_repo.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';

class AuthRepoImpl implements AuthRepo {
  final RemoteDataSource remoteDataSource;
  final SecureLocalDataSource secureLocalDataSource;
  final NetworkInfo networkInfo;

  AuthRepoImpl({
    required this.remoteDataSource,
    required this.secureLocalDataSource,
    required this.networkInfo
  });

  @override
  Future<Either<Failure, OwnerEntity>> auth(
      {required String accessToken}) async {
    if (await networkInfo.isConnected) {
      try {
        final owner = await remoteDataSource.auth(accessToken: accessToken);
        secureLocalDataSource.saveAccessToken(accessToken: accessToken);
        return Right(OwnerMapper.ownerEntityFromApi(owner));
      } on ServerException catch (error) {
        return Left(
            ResponseFailure(message: error.message, prefix: error.prefix)
        );
      } on Exception catch (error) {
        return Left(ResponseFailure(
            message: '${error.toString()}. ${LocaleKeys.please_send_this_message_to_developer.tr()}',
            prefix: LocaleKeys.error.tr()
        )
        );
      }
    } else {
      return Left(NetworkFailure());
    }
  }
}
