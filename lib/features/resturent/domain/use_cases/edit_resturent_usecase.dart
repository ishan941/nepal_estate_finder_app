// edit_resturent_usecase.dart

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/features/resturent/domain/repository/resturent_repository.dart';

class EditResturentUseCase implements UseCase<bool, EditResturentParams> {
  final ResturentRepository resturentRepository;

  EditResturentUseCase({required this.resturentRepository});

  @override
  Future<Either<Failure, bool>> call(EditResturentParams params) async {
    return await resturentRepository.editResturent(queryData: params.queryData, id: params.id);
  }
}
class EditResturentParams extends Equatable {
  final Map<String, dynamic> queryData;
  final String id;

  const EditResturentParams({required this.queryData, required this.id});

  @override
  List<Object> get props => [queryData, id];
}