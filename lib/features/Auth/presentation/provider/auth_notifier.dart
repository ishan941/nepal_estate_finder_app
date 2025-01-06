import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/utils/shared_preference.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/model/auth_model/auth_model.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/model/auth_state/auth_state.dart';
import 'package:provider_with_clean_architecture/features/Auth/domain/service/user_hive_service.dart';
import 'package:provider_with_clean_architecture/features/Auth/domain/usecase/login_use_case.dart';
import 'package:provider_with_clean_architecture/injection_container.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;
  final SignUpUserUseCase signUpUserUseCase;
  final SharedPref sharedPref;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  AuthNotifier({
    required this.signUpUserUseCase,
    required this.loginUseCase,
    required this.sharedPref,
  }) : super(const AuthState.idle());

  String _mapErrorToMessage(String error) {
    if (error.contains('401')) {
      return 'Invalid credentials. Please try again.';
    } else if (error.contains('Network')) {
      return 'Network error. Check your connection.';
    }
    return 'An unexpected error occurred.';
  }

  Future<void> login(String email, String password) async {
    try {
      state = AuthState.loading(rememberMe: state.rememberMe);
      final userData = await loginUseCase.execute(email, password);

      if (userData == null || userData.isEmpty) {
        state = AuthState.error('Invalid login response',
            rememberMe: state.rememberMe);
        return;
      }

      final user = AuthModel.fromJson(userData);
      await sharedPref.saveDataToPreference(accessTokenKey, user.accessToken);
      await sharedPref.saveDataToPreference(userIdKey, user.id);

      state = AuthState.authenticated(user, rememberMe: state.rememberMe);
    } catch (e) {
      final errorMessage = _mapErrorToMessage(e.toString());
      state = AuthState.error(errorMessage, rememberMe: state.rememberMe);
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

  Future<void> fetchUser() async {
    final userHiveService = UserHiveService();
    final user = await userHiveService.getUserFromHive();
    if (user != null) {
      print('User: ${user.username}, Email: ${user.email}');
    } else {
      print('No user data found in Hive.');
    }
  }

  Future<void> logout() async {
    state = AuthState.loading(rememberMe: state.rememberMe);

    final userHiveService = UserHiveService();
    await sharedPref.clearPreferenceData();
    await userHiveService.clearUserData();
    state = AuthState.unauthenticated(rememberMe: state.rememberMe);
    print('User data cleared from Hive.');
  }

  void toggleRememberMe(bool value) async {
    await sharedPref.saveDataToPreference('remember_me', value);
    state = state.when(
      idle: (_) => AuthState.idle(rememberMe: value),
      loading: (_) => AuthState.loading(rememberMe: value),
      authenticated: (user, _) =>
          AuthState.authenticated(user, rememberMe: value),
      unauthenticated: (_) => AuthState.unauthenticated(rememberMe: value),
      error: (message, _) => AuthState.error(message, rememberMe: value),
    );
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(
    loginUseCase: LoginUseCase(authRepository: sl()),
    signUpUserUseCase: SignUpUserUseCase(authRepository: sl()),
    sharedPref: sl(),
  ),
);
