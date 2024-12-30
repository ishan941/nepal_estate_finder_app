import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

class Params extends Equatable {
  final String token;

  const Params({required this.token});

  @override
  List<Object> get props => [token];
}
