import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/error/exception_error.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';

abstract class AuthDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
}

class AuthDataSourceImpl implements AuthDataSource {
  final DioHttp dioHttp;
  AuthDataSourceImpl({required this.dioHttp});

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    final Response response = await dioHttp.post(
      url: Api.baseUrl + Api.baseUrl,
      data: {'email': email, 'password': password},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    } else {
      throw ServerException(response.statusMessage, response.statusCode);
    }
  }
}
