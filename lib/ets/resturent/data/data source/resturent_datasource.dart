import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/error/exception_error.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
import 'package:provider_with_clean_architecture/ets/resturent/data/model/resturent_model.dart';

abstract class ResturentDataSource {
  Future<bool> saveResturent({
    required Map queryData,
  });
  Future<List<ResturentModel>> getResturent();
  Future<bool> deleteResturent({required String id});
  Future<bool> editResturent(
      {required Map<String, dynamic> queryData, required String id});
}

class ResturentDataSourceImpl implements ResturentDataSource {
  final DioHttp dioHttp;

  ResturentDataSourceImpl({required this.dioHttp});
  @override
  Future<bool> saveResturent({required Map queryData}) async {
    final Response response = await dioHttp.post(
      url: Api.baseUrl + Api.addResturentApi,
      data: queryData,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw ServerException(response.statusMessage, response.statusCode);
    }
  }

  @override
  Future<List<ResturentModel>> getResturent() async {
    final Response response =
        await dioHttp.get(url: Api.baseUrl + Api.getResturentApi);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> responseData = response.data;

      List<ResturentModel> getResturentList = await compute(
        resturentModelListFromJson,
        responseData,
      );
      return getResturentList;
    } else {
      throw ServerException(response.statusMessage, response.statusCode);
    }
  }

  @override
  Future<bool> deleteResturent({required String id}) async {
    final Response response =
        await dioHttp.delete(url: Api.baseUrl + Api.deleteResturentApi + id);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw ServerException(response.statusMessage, response.statusCode);
    }
  }

  @override
  Future<bool> editResturent(
      {required Map<String, dynamic> queryData, required String id}) async {
    final Response response = await dioHttp.patch(
      url: Api.baseUrl + Api.editResturentApi + id,
      data: queryData,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      throw ServerException(response.statusMessage, response.statusCode);
    }
  }
}
