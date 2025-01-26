import 'dart:io';

import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/error/exception_error.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/model/auth_model/auth_model.dart';
import 'package:provider_with_clean_architecture/features/Auth/domain/service/user_hive_service.dart';

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
    try {
      final Response response = await dioHttp.post(
        url: Api.baseUrl + Api.loginApi,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == HttpStatus.ok ||
          response.statusCode == HttpStatus.created) {
        final authModel = AuthModel.fromJson(response.data);
        final user = authModel.toHiveUser();

        // Save user to Hive
        await userHiveService.saveUserToHive(user);

        return {
          'user': user,
          'accessToken':
              authModel.accessToken, // Return accessToken if required
        };
      } else {
        throw ServerException(
          response.statusMessage ?? 'Unknown error',
          response.statusCode,
        );
      }
    } catch (e) {
      // Log or handle unexpected errors
      print('Error during login: $e');
      rethrow; // Rethrow to propagate the exception
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
