import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/ets/user/domain/repositories/user_repositories.dart';

class PostUseCase implements UseCase<bool, PostParams> {
  final PostRepositories postRepositories;

  PostUseCase({required this.postRepositories});

  @override
  Future<Either<Failure, bool>> call(PostParams params) async {
    return await postRepositories.postUserData(queryData: params.queryData);
  }
}

class PostParams extends Equatable {
  final Map queryData;
  const PostParams({required this.queryData});
  @override
  List<Object> get props => [queryData];
}
