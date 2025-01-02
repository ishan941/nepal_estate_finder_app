import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/networkinfo/network_info.dart';
import 'package:provider_with_clean_architecture/core/token_service/repository/base_repository.dart';
import 'package:provider_with_clean_architecture/core/token_service/services/token_service.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';
import 'package:provider_with_clean_architecture/features/ets/profile/data/datasource/user_data_source.dart';
import 'package:provider_with_clean_architecture/features/ets/profile/data/model/model/user_model.dart';
import 'package:provider_with_clean_architecture/features/ets/profile/domain/repository/user_repository.dart';

class UserRepositoryImpl extends BaseRepository implements UserRepository {
  NetworkInfo networkInfo;
  UserDataSource userDataSource;
  TokenService tService;
  UserRepositoryImpl({
    required this.networkInfo,
    required this.userDataSource,
    required this.tService,
  }) : super(tokenService: tService);

  @override
  Future<Either<Failure, UserModel>> getUserData() async {
    if (await networkInfo.isConnected) {
      try {
        final UserModel userModel =
            await userDataSource.getUser(token: accessToken);
        return Right(userModel);
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure(
              (e.response?.data == null) ? e.message : e.response?.data,
              e.response?.statusCode));
        } else {
          return const Left(ServerFailure(somethingWentWrongStr, 0));
        }
      }
    } else {
      return const Left(NetworkFailure(noInternetConnection, 0));
    }
  }
}
