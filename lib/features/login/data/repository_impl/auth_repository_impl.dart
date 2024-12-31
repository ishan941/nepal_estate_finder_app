import 'package:provider_with_clean_architecture/core/networkinfo/network_info.dart';
import 'package:provider_with_clean_architecture/features/login/data/datasource/auth_data_source.dart';
import 'package:provider_with_clean_architecture/features/login/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.authDataSource,
    required this.networkInfo,
  });

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    return authDataSource.login(email, password);
  }
}
