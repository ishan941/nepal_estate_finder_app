import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/error/exception_error.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
import 'package:provider_with_clean_architecture/features/login/data/model/auth_model/auth_model.dart';
import 'package:provider_with_clean_architecture/features/login/data/model/hive/user.dart';
import 'package:provider_with_clean_architecture/features/login/domain/service/user_hive_service.dart';

abstract class AuthDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<Map<String, dynamic>> signUpUser(
      String username, String email, String password);
}

class AuthDataSourceImpl implements AuthDataSource {
  final DioHttp dioHttp;
  final UserHiveService userHiveService;

  AuthDataSourceImpl({required this.userHiveService, required this.dioHttp});

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final Response response = await dioHttp.post(
      url: Api.baseUrl + Api.loginApi,
      // url: "https://1a04-27-34-73-167.ngrok-free.app/api/auth/signin",
      data: {'email': email, 'password': password},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Parse the response
      final authModel = AuthModel.fromJson(response.data);

      // Convert AuthModel to User and save to Hive
      final user = authModel.toHiveUser();
      await userHiveService.saveUserToHive(user);

      return response.data;
    } else {
      throw ServerException(response.statusMessage, response.statusCode);
    }
  }

  @override
  Future<Map<String, dynamic>> signUpUser(
      String username, String email, String password) async {
    final Response response = await dioHttp.post(
      url: Api.baseUrl + Api.signUpUserApi,
      data: {'username': username, 'email': email, 'password': password},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw ServerException(response.statusMessage, response.statusCode);
    }
  }
}
