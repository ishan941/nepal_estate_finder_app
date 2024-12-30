import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/error/exception_error.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';

abstract class PostDataSource {
  Future<bool> postUserData({required Map queryData});
}

class PostDataSourceImpl extends PostDataSource {
  final DioHttp dioHttp;
  PostDataSourceImpl({required this.dioHttp});
  @override
  Future<bool> postUserData({required Map queryData}) async {
    final Response response =
        await dioHttp.post(url: Api.baseUrl + Api.postUserApi, data: queryData);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException(response.statusMessage, response.statusCode);
    }
  }
}
