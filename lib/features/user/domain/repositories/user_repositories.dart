import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';

abstract class PostRepositories{
Future<Either<Failure, bool>> postUserData({required Map queryData});
}