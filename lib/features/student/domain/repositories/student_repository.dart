import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/features/student/domain/entities/student_response_entity.dart';

abstract class StudentRepository {
  Future<Either<Failure, bool>> saveStudent({required Map queryData});
  Future<Either<Failure, List<StudentResponseEntity>>> getStudentDetails();
}
