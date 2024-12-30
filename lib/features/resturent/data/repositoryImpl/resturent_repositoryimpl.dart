import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/networkinfo/network_info.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';
import 'package:provider_with_clean_architecture/features/resturent/data/data%20source/resturent_datasource.dart';
import 'package:provider_with_clean_architecture/features/resturent/domain/entities/resturent_entities.dart';
import 'package:provider_with_clean_architecture/features/resturent/domain/repository/resturent_repository.dart';

class ResturentRepositoryImpl extends ResturentRepository {
  final ResturentDataSource resturentDataSource;
  final NetworkInfo networkInfo;
  ResturentRepositoryImpl(
      {required this.networkInfo, required this.resturentDataSource});

  @override
  Future<Either<Failure, bool>> addResturent({required Map queryData}) async {
    if (await networkInfo.isConnected) {
      try {
        await resturentDataSource.saveResturent(queryData: queryData);
        return const Right(true);
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

  @override
  Future<Either<Failure, List<ResturentResponseEntity>>>
      getResturentDetails() async {
    if (await networkInfo.isConnected) {
      try {
        List<ResturentResponseEntity> resturentResponseEntity =
            await resturentDataSource.getResturent();
        return Right(resturentResponseEntity);
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

  @override
  Future<Either<Failure, bool>> deleteResturent({required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        await resturentDataSource.deleteResturent(id: id);
        return const Right(true);
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

  @override
  Future<Either<Failure, bool>> editResturent({
    required Map<String, dynamic> queryData,
    required String id,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await resturentDataSource.editResturent(queryData: queryData, id: id);
        return Right(result);
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

  // @override
  // Future<Either<Failure, List<StudentResponseEntity>>>
  //     getStudentDetails() async {
  //   if (await networkInfo.isConnected) {
  //     try {
  //       List<StudentResponseEntity> studentResponseEntity =
  //           await studentDataSource.getStudent();
  //       return Right(studentResponseEntity);
  //     } catch (e) {
  //       if (e is DioException) {
  //         return Left(ServerFailure(
  //             (e.response?.data == null) ? e.message : e.response?.data,
  //             e.response?.statusCode));
  //       } else {
  //         return const Left(ServerFailure(somethingWentWrongStr, 0));
  //       }
  //     }
  //   } else {
  //     return const Left(NetworkFailure(noInternetConnection, 0));
  //   }
  // }
