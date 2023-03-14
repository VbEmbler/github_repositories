import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:github_repositories/core/error/exceptions/server_exceptions/bad_request_exception.dart';
import 'package:github_repositories/core/error/exceptions/server_exceptions/fetch_data_exception.dart';
import 'package:github_repositories/core/error/exceptions/server_exceptions/moved_permanently_exception.dart';
import 'package:github_repositories/core/error/exceptions/server_exceptions/not_found_exception.dart';
import 'package:github_repositories/core/error/exceptions/server_exceptions/server_exception.dart';
import 'package:github_repositories/core/error/exceptions/server_exceptions/unauthorized_exception.dart';
import 'package:github_repositories/data/models/owner_model.dart';
import 'package:github_repositories/data/models/repository_model.dart';
import 'package:github_repositories/data/models/repository_readme_model.dart';
import 'package:github_repositories/generated/locale_keys.g.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://api.github.com';
const timeoutDuration = 15;
const queryParameters = {
  'sort': 'updated',
  'per_page': '10'
};

abstract class RemoteDataSource {
  Future<OwnerModel> auth({required String accessToken});
  Future<List<RepositoryModel>> getRepositories({required String accessToken});
  Future<RepositoryModel> getRepository({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  });
  Future<RepositoryReadmeModel> getRepositoryReadme({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  });
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client httpClient;

  RemoteDataSourceImpl({required this.httpClient});

  @override
  Future<OwnerModel> auth({required String accessToken}) async {
    var uri = Uri.parse('$baseUrl/user');
    try {
      var response = await httpClient.get(
          uri,
          headers: _getHeaders(accessToken: accessToken)
      ).timeout(const Duration(seconds: timeoutDuration));

      if (response.statusCode == 200) {
        final owner = response.body;
        return ownerModelFromApi(owner);
      } else {
        var exception = _processResponse(response);
        throw ServerException(
            statusCode: response.statusCode,
            message: exception.message,
            prefix: exception.prefix);
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<List<RepositoryModel>> getRepositories({required String accessToken}) async {
    var uri = Uri.parse('$baseUrl/user/repos').replace(queryParameters: queryParameters);
    try {
      final response = await httpClient.get(
          uri,
          headers: _getHeaders(accessToken: accessToken)
      ).timeout(const Duration(seconds: timeoutDuration));

      if (response.statusCode == 200) {
        final repositories = response.body;
        return repositoryModelListFromApi(repositories);
      } else {
        var exception = _processResponse(response);
        throw ServerException(
            statusCode: response.statusCode,
            message: exception.message,
            prefix: exception.prefix);
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<RepositoryModel> getRepository({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  }) async {
    var uri = Uri.parse('$baseUrl/repos/$ownerLogin/$repositoryName');
    try {
      var response = await httpClient.get(
          uri,
          headers: _getHeaders(accessToken: accessToken)
      ).timeout(const Duration(seconds: timeoutDuration));

      if (response.statusCode == 200) {
        final repository = response.body;
        return repositoryModelFromApi(repository);
      } else {
        var exception = _processResponse(response);
        throw ServerException(
            statusCode: response.statusCode,
            message: exception.message,
            prefix: exception.prefix);
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  @override
  Future<RepositoryReadmeModel> getRepositoryReadme({
    required String accessToken,
    required String ownerLogin,
    required String repositoryName
  }) async {
    var uri = Uri.parse('$baseUrl/repos/$ownerLogin/$repositoryName/readme');
    try {
      var response = await httpClient.get(
          uri,
          headers: _getHeaders(accessToken: accessToken)
      ).timeout(const Duration(seconds: timeoutDuration));

      if (response.statusCode == 200) {
        final repositoryReadme = response.body;
        return repositoryReadmeModelFromApi(repositoryReadme);
      } else {
        var exception = _processResponse(response);
        throw ServerException(
            statusCode: response.statusCode,
            message: exception.message,
            prefix: exception.prefix);
      }
    } catch (error) {
      return Future.error(error);
    }
  }

  Map<String, String> _getHeaders({required String accessToken}) {
    Map<String, String> headers = {
      'Accept': 'application/vnd.github+json',
      'Authorization': 'Bearer $accessToken',
      'X-GitHub-Api-Version': '2022-11-28',
    };
    return headers;
  }

  ServerException _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 301:
        return MovedPermanentlyException(
            message: jsonDecode(response.body)['message']);
      case 400: //Bad request
        return BadRequestException(
            message: jsonDecode(response.body)['message']);
      case 401: //Unauthorized
        return UnAuthorizedException(
            message: jsonDecode(response.body)['message']);
      case 403: //Forbidden
        return UnAuthorizedException(
            message: jsonDecode(response.body)['message']);
      case 404: //Resource Not Found
        return NotFoundException(
            statusCode: response.statusCode,
            message: jsonDecode(response.body)['message']);
      case 500: //Internal Server Error
      default:
        return FetchDataException(
            message: '${LocaleKeys.something_went_wrong.tr()} ${response.statusCode}');
    }
  }
}
