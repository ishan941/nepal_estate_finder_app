import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/features/ets/profile/data/model/model/user_model.dart';
import 'package:provider_with_clean_architecture/features/ets/profile/data/model/state/user_state.dart';
import 'package:provider_with_clean_architecture/features/ets/profile/domain/usecase/get_user_use_case.dart';
import 'package:provider_with_clean_architecture/injection_container.dart';

class UserNotifier extends StateNotifier<UserState> {
  final GetUserUseCase getUserUseCase;
  UserNotifier({required this.getUserUseCase}) : super(const UserState.idle());

  UserModel? userModel;

  Future<void> getUserData() async {
    state = const UserState.loading();
    final result = await getUserUseCase(NoParams());
    result.fold((failure) {
      state = UserState.error(failure.message);
    }, (data) {
      userModel = data;
      state = UserState.success(userModel);
    });
  }
}

final userState = StateNotifierProvider<UserNotifier, UserState>((ref) =>
    UserNotifier(getUserUseCase: GetUserUseCase(userRepository: sl())));
