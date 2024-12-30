import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/error/exception_error.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
import 'package:provider_with_clean_architecture/features/student/data/model/student_model.dart';

abstract class StudentDataSource {
  Future<bool> saveStudent({
    required Map queryData,
  });
  Future<List<StudentModel>> getStudent();
}

class StudentDataSourceImpl implements StudentDataSource {
  final DioHttp dioHttp;

  StudentDataSourceImpl({required this.dioHttp});
  @override
  Future<bool> saveStudent({
    required Map queryData,
  }) async {
    final Response response = await dioHttp.post(
      url: Api.baseUrl + Api.addResturentApi,
      data: queryData,
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      throw ServerException(response.statusMessage, response.statusCode);
    }
  }

  @override
  Future<List<StudentModel>> getStudent() async {
    final Response response =
        await dioHttp.get(url: Api.baseUrl + Api.getStudentDetails);
    if (response.statusCode == 200) {
      List<dynamic> responseData = response.data;

      List<StudentModel> studentList = await compute(
        studentModelListFromJson,
        responseData,
      );
      return studentList;
    } else {
      throw ServerException(response.statusMessage, response.statusCode);
    }
  }
}
