import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/ets/student/domain/repositories/student_repository.dart';

class StudentUseCase implements UseCase<bool, StudentParams> {
  final StudentRepository studentRepository;

  StudentUseCase({
    required this.studentRepository,
  });

  @override
  Future<Either<Failure, bool>> call(StudentParams params) async {
    return await studentRepository.saveStudent(queryData: params.queryData);
  }
}

class StudentParams extends Equatable {
  final Map queryData;
  const StudentParams({required this.queryData});
  @override
  List<Object> get props => [queryData];
}
