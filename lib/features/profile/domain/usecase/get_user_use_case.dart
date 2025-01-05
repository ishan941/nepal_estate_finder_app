import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/features/profile/data/model/model/user_model.dart';

import 'package:provider_with_clean_architecture/features/profile/domain/repository/user_repository.dart';

class GetUserUseCase extends UseCase<UserModel, String> {
  final UserRepository userRepository;
  GetUserUseCase({required this.userRepository});

  @override
  Future<Either<Failure, UserModel>> call(String userId) {
    return userRepository.getUserData(userId);
  }
}

class UpdateUserUseCase extends UseCase<UserModel, UserModel> {
  final UserRepository userRepository;
  UpdateUserUseCase({required this.userRepository});

  @override
  Future<Either<Failure, UserModel>> call(UserModel updatedUser) {
    return userRepository.updateUser(updatedUser);
  }
}

class DeleteUserUseCase extends UseCase<UserModel, String> {
  final UserRepository userRepository;
  DeleteUserUseCase({required this.userRepository});

  @override
  Future<Either<Failure, UserModel>> call(String userId) {
    return userRepository.deleteUser(userId);
  }
}
