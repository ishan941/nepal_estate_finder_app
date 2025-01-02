import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/features/ets/resturent/domain/repository/resturent_repository.dart';

class ResturentUseCase implements UseCase<bool, ResturentParams> {
  final ResturentRepository resturentRepository;

  ResturentUseCase({
    required this.resturentRepository,
  });

  @override
  Future<Either<Failure, bool>> call(ResturentParams params) async {
    return await resturentRepository.addResturent(queryData: params.queryData);
  }
}

class ResturentParams extends Equatable {
  final Map<String, dynamic> queryData;
  final String? id; // Optional id parameter

  const ResturentParams(
      {required this.queryData, this.id}); // Optional id in constructor

  @override
  List<Object?> get props => [queryData, id]; // Include id in props
}
