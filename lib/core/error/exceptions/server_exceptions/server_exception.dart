class ServerException implements Exception {
  final String? message;
  final String? prefix;
  int? statusCode;

  ServerException({required this.statusCode, required this.message, required this.prefix});
}
