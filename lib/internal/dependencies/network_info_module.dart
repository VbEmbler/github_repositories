import 'package:github_repositories/core/platform/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoModule {
  static NetworkInfoImpl? _networkInfoImpl;
  static NetworkInfoImpl networkInfoImpl() {
    _networkInfoImpl ??= NetworkInfoImpl(InternetConnectionChecker());
    return _networkInfoImpl!;
  }
}
