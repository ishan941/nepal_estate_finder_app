import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/error/exception_error.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
import 'package:provider_with_clean_architecture/features/profile/data/model/model/user_model.dart';

abstract class UserDataSource {
  Future<UserModel> getUser({String? token, String? userId});
  Future<UserModel> updateUser({String? token, required UserModel updatedUser});
}

class UserDataSourceImpl extends UserDataSource {
  final DioHttp dioHttp;
  UserDataSourceImpl({required this.dioHttp});
  @override
  Future<UserModel> getUser({String? token, String? userId}) async {
    try {
      Response response = await dioHttp.get(
          url: Api.baseUrl + Api.getUserByIdApi + userId!, token: token);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(response.statusMessage, response.statusCode);
      }
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }

  @override
  Future<UserModel> updateUser(
      {String? token, required UserModel updatedUser}) async {
    try {
      Response response = await dioHttp.post(
          url: Api.baseUrl + Api.updateUserByIdApi + updatedUser.id,
          token: token,
          data: updatedUser.toJson());
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(response.statusMessage, response.statusCode);
      }
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }
}
