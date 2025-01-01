import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/features/profile/data/model/model/user_model.dart';

import 'package:provider_with_clean_architecture/features/profile/domain/repository/user_repository.dart';

class GetUserUseCase extends UseCase<UserModel, NoParams> {
  final UserRepository userRepository;
  GetUserUseCase({required this.userRepository});

  @override
  Future<Either<Failure, UserModel>> call(NoParams params) {
    return userRepository.getUserData();
  }
}
