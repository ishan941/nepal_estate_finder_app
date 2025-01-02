import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/networkinfo/network_info.dart';
import 'package:provider_with_clean_architecture/features/ets/resturent/data/data%20source/resturent_datasource.dart';
import 'package:provider_with_clean_architecture/features/ets/resturent/domain/repository/resturent_repository.dart';
import 'package:provider_with_clean_architecture/features/ets/user/data/datasource/post_source.dart';
import 'package:provider_with_clean_architecture/features/ets/user/domain/repositories/user_repositories.dart';

class PostRepositoriesImpl extends PostRepositories {
  final PostDataSource postDataSource;
  final NetworkInfo networkInfo;
  PostRepositoriesImpl(
      {required this.networkInfo, required this.postDataSource});

  @override
  Future<Either<Failure, bool>> postUserData({required Map queryData}) async {
    if (await networkInfo.isConnected) {
      try {
        await postDataSource.postUserData(queryData: queryData);
        return const Right(true);
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure(
              (e.response?.data == null) ? e.message : e.response?.data,
              e.response?.statusCode));
        } else {
          return const Left(ServerFailure("something Went Wrong", 0));
        }
      }
    } else {
      return const Left(NetworkFailure("noInternet Connection", 0));
    }
  }
}
