import 'package:provider_with_clean_architecture/features/login/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Map<String, dynamic>> execute(String email, String password) {
    return authRepository.login(email, password);
  }
}

class SignUpUserUseCase {
  final AuthRepository authRepository;
  SignUpUserUseCase({required this.authRepository});
  Future<Map<String, dynamic>> execute(
      String username, String email, String password) {
    return authRepository.signUpUser(username, email, password);
  }
}
