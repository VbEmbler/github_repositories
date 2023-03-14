abstract class Failure implements Exception {
  final String? message;
  final String? prefix;
  final int? statusCode;

  Failure({this.statusCode, required this.message, required this.prefix});
}


