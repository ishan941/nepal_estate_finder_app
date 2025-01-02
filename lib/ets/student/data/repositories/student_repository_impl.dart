import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/networkinfo/network_info.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';
import 'package:provider_with_clean_architecture/features/ets/student/data/datasource/student_datasource.dart';
import 'package:provider_with_clean_architecture/features/ets/student/domain/entities/student_response_entity.dart';
import 'package:provider_with_clean_architecture/features/ets/student/domain/repositories/student_repository.dart';

class StudentRepositoryImpl extends StudentRepository {
  final StudentDataSource studentDataSource;
  final NetworkInfo networkInfo;

  StudentRepositoryImpl(
      {required this.studentDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, bool>> saveStudent({required Map queryData}) async {
    if (await networkInfo.isConnected) {
      try {
        await studentDataSource.saveStudent(queryData: queryData);
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
  Future<Either<Failure, List<StudentResponseEntity>>>
      getStudentDetails() async {
    if (await networkInfo.isConnected) {
      try {
        List<StudentResponseEntity> studentResponseEntity =
            await studentDataSource.getStudent();
        return Right(studentResponseEntity);
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
