import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/utils/info_helper.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';

Dio dio = Dio(
  BaseOptions(
      baseUrl: Api.baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15)),
)..interceptors.add(LoggingInterceptor());

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          "\n\n===============================================================\n\n");
      print('REQUEST[${options.method}] => PATH: ${options.path}');
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          "\n\n===============================================================\n\n");
      print(
        'RESPONSE PATH[${response.statusCode}] => PATH: ${response.requestOptions.path}',
      );
      print(
          'RESPONSE VALUE [${response.statusCode}] => ${jsonEncode(response.data.toString())}');
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      print(
          "\n\n===============================================================\n\n");
      print(
          'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
      print('ERROR RESPONSE ${jsonEncode(err.response?.data.toString())}');
    }
    if (err.response?.statusCode == 401) {
      InfoHelper.showToast(sessionExpiredStr);
      // navigate to loginpage
      return;
    }
    return super.onError(err, handler);
  }
}
