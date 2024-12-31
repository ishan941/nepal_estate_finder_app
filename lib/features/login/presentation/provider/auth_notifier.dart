import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/features/login/data/model/auth_model/auth_model.dart';
import 'package:provider_with_clean_architecture/features/login/data/model/auth_state/auth_state.dart';
import 'package:provider_with_clean_architecture/features/login/domain/usecase/login_use_case.dart';
import 'package:provider_with_clean_architecture/injection_container.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;

  AuthNotifier({required this.loginUseCase}) : super(const AuthState.idle());

  Future<void> login(String email, String password) async {
    try {
      state = const AuthState.loading();
      final userData = await loginUseCase.execute(email, password);
      final user = AuthModel.fromJson(userData);
      state = AuthState.authenticated(user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  void logout() {
    state = const AuthState.unauthenticated();
  }
}

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) => sl<AuthNotifier>());
