import 'package:github_repositories/data/datasources/remote_datasource.dart';
import 'package:http/http.dart' as http;

class ApiModule{
  static RemoteDataSourceImpl? _remoteDataSourceImpl;
  static RemoteDataSourceImpl remoteDataSourceImpl() {
    _remoteDataSourceImpl ??= RemoteDataSourceImpl(httpClient: http.Client());
    return _remoteDataSourceImpl!;
  }

}