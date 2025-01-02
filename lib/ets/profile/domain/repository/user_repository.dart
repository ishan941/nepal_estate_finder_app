import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/model/model/user_model.dart';

abstract class UserRepository {
  Future<Either<Failure, UserModel>> getUserData();
}
