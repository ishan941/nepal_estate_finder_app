import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/features/profile/data/model/model/user_model.dart';
import 'package:provider_with_clean_architecture/features/profile/data/model/state/user_state.dart';
import 'package:provider_with_clean_architecture/features/profile/domain/usecase/get_user_use_case.dart';
import 'package:provider_with_clean_architecture/injection_container.dart';

class UserNotifier extends StateNotifier<UserState> {
  final GetUserUseCase getUserUseCase;
  final UpdateUserUseCase updateUserUseCase;
  final DeleteUserUseCase deleteUserCase;
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController password = TextEditingController();
  UserNotifier({
    required this.updateUserUseCase,
    required this.getUserUseCase,
    required this.deleteUserCase,
  }) : super(const UserState.idle());

  UserModel? userModel;
  UserModel? editedUser;

  Future<void> getUserData(String userId) async {
    state = const UserState.loading();
    final result = await getUserUseCase(userId);
    result.fold((failure) {
      state = UserState.error(failure.message);
    }, (data) {
      userModel = data;
      editedUser = data;
      state = UserState.success(userModel!);
    });
  }

  Future<bool> updateUser(String userId, UserModel updatedUser) async {
    try {
      state = const UserState.loading();
      await updateUserUseCase(updatedUser);
      userModel = updatedUser;
      state = UserState.success(userModel!);

      return true;
    } catch (error) {
      state = UserState.error(error.toString());

      return false;
    }
  }

  Future<bool> deleteUser(String userId) async {
    try {
      state = const UserState.loading();
      await deleteUser(userId);

      return true;
    } catch (error) {
      return false;
    }
  }
}

final userState = StateNotifierProvider<UserNotifier, UserState>((ref) =>
    UserNotifier(
        getUserUseCase: GetUserUseCase(userRepository: sl()),
        updateUserUseCase: UpdateUserUseCase(userRepository: sl()),
        deleteUserCase: DeleteUserUseCase(userRepository: sl())));
