import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/features/ets/resturent/domain/entities/resturent_entities.dart';
import 'package:provider_with_clean_architecture/features/ets/resturent/domain/repository/resturent_repository.dart';

class GetResturentUseCase
    implements UseCase<List<ResturentResponseEntity>, NoParams> {
  final ResturentRepository resturentRepository;

  GetResturentUseCase({required this.resturentRepository});

  @override
  Future<Either<Failure, List<ResturentResponseEntity>>> call(
      NoParams params) async {
    return await resturentRepository.getResturentDetails();
  }
}
