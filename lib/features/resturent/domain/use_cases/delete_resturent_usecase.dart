import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/features/resturent/domain/repository/resturent_repository.dart';

class DeleteResturentUseCase implements UseCase<bool, String> {
  final ResturentRepository resturentRepository;
  
  DeleteResturentUseCase({
    required this.resturentRepository,
  });

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return await resturentRepository.deleteResturent(id: params);
  }
}


