import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/entities/resturent_entities.dart';

//service
abstract class ResturentRepository {
  Future<Either<Failure, bool>> addResturent({required Map queryData});
  Future<Either<Failure, List<ResturentResponseEntity>>> getResturentDetails();
  Future<Either<Failure, bool>> deleteResturent({required String id});
  Future<Either<Failure, bool>> editResturent(
      {required Map<String, dynamic> queryData, required String id});
}
