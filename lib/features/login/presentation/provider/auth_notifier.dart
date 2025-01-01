import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/utils/shared_preference.dart';
import 'package:provider_with_clean_architecture/features/login/data/model/auth_model/auth_model.dart';
import 'package:provider_with_clean_architecture/features/login/data/model/auth_state/auth_state.dart';
import 'package:provider_with_clean_architecture/features/login/domain/usecase/login_use_case.dart';
import 'package:provider_with_clean_architecture/injection_container.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUserUseCase signUpUserUseCase;
  final SharedPref sharedPref;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  AuthNotifier({
    required this.signUpUserUseCase,
    required this.loginUseCase,
    required this.sharedPref,
  }) : super(const AuthState.idle());

  Future<void> login(String email, String password) async {
    try {
      state = const AuthState.loading();
      final userData = await loginUseCase.execute(email, password);
      final user = AuthModel.fromJson(userData);
      await sharedPref.saveDataToPreference(accessTokenKey, user.accessToken);

      state = AuthState.authenticated(user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signUpUser(
      String username, String email, String password) async {
    try {
      state = const AuthState.loading();
      final userData =
          await signUpUserUseCase.execute(username, email, password);
      final user = AuthModel.fromJson(userData);
      state = AuthState.authenticated(user);
    } catch (error) {
      state = AuthState.error(error.toString());
    }
  }

  void logout() {
    state = const AuthState.unauthenticated();
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    loginUseCase: LoginUseCase(authRepository: sl()),
    signUpUserUseCase: SignUpUserUseCase(authRepository: sl()),
    sharedPref: sl(),
  ),
);
