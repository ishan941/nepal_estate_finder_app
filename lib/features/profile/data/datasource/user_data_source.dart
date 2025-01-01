import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/error/exception_error.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
import 'package:provider_with_clean_architecture/features/profile/data/model/model/user_model.dart';

abstract class UserDataSource {
  Future<UserModel> getUser({String? token});
}

class UserDataSourceImpl extends UserDataSource {
  final DioHttp dioHttp;
  UserDataSourceImpl({required this.dioHttp});
  @override
  Future<UserModel> getUser({String? token}) async {
    try {
      Response response = await dioHttp.get(
          url:
              "https://762b-27-34-73-251.ngrok-free.app/api/user/676d621e9e8164aa7896d4d1",
          token:
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3NmQ3NWQ2NmViMzYwMmVmMzkwNzU2YyIsImlhdCI6MTczNTc0MzYxMn0._VgLUZ1PP_dkfWWQ2iTxS_b3X5WDccKliWAAfYvIHuA"
          // Api.baseUrl + Api.getUserByIdApi
          );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(response.statusMessage, response.statusCode);
      }
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }
  // Future<UserModel> getUser() async {
  //   return UserModel(
  //     id: '676d621e9e8164aa7896d4d1',
  //     username: 'JohnDoe',
  //     email: 'john@example.com',
  //     bio: 'Test bio',
  //     avatar: 'https://example.com/avatar.png',
  //   );
  // }
}
