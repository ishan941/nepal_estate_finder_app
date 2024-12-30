class ServerException implements Exception {
  final String? message;
  final int? errorCode;
  ServerException(this.message, this.errorCode);
}
