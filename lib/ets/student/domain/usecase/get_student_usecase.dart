import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/ets/student/domain/entities/student_response_entity.dart';
import 'package:provider_with_clean_architecture/ets/student/domain/repositories/student_repository.dart';

class GetStudentUseCase
    implements UseCase<List<StudentResponseEntity>, NoParams> {
  final StudentRepository studentRepository;

  GetStudentUseCase({
    required this.studentRepository,
  });

  @override
  Future<Either<Failure, List<StudentResponseEntity>>> call(
      NoParams params) async {
    return await studentRepository.getStudentDetails();
  }
}
