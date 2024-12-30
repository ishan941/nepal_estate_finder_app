import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final dynamic message;
  final int? errorCode;

  const Failure(this.message, this.errorCode);

  @override
  List<Object?> get props => [message, errorCode];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(dynamic message, int? errorCode)
      : super(message, errorCode);
}

class CacheFailure extends Failure {
  const CacheFailure(String message, int errorCode) : super(message, errorCode);
}

class NetworkFailure extends Failure {
  const NetworkFailure(String message, int errorCode)
      : super(message, errorCode);
}

class SessionExpiredFailure extends Failure {
  const SessionExpiredFailure(String message, int errorCode)
      : super(message, errorCode);
}
