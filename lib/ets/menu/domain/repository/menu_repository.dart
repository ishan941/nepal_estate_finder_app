import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';

abstract class MenuRepository {
  Future<Either<Failure, bool>> crateMenu({required Map queryData});
}
