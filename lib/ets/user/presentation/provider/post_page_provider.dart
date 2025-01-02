import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/error_helper.dart';
import 'package:provider_with_clean_architecture/core/utils/status_util.dart';
import 'package:provider_with_clean_architecture/ets/user/data/model/post_model.dart';
import 'package:provider_with_clean_architecture/ets/user/domain/usecase/post_usecase.dart';

class PostPageProvider extends ChangeNotifier {
  String? tableName, floor;
  String? errormsg;
  int? tableNumber, numberOfSeats;
  bool? isSuccess;

  PostUseCase postUseCase;
  PostPageProvider({required this.postUseCase});

  StatusUtil postPageUtil = StatusUtil.none;

  setPostPageUtil(StatusUtil statusUtil) {
    postPageUtil = statusUtil;
  }

  Future<void> postPageData() async {
    if (postPageUtil == StatusUtil.loading) {
      setPostPageUtil(StatusUtil.loading);
    }
    PostModel postModel = PostModel(
        restaurantId: "1234",
        tableName: tableName,
        tableNumber: tableNumber,
        floor: floor,
        numberOfSeats: numberOfSeats);
    Either<Failure, bool> response =
        await postUseCase(PostParams(queryData: postModel.toJson()));
    response.fold((failure) {
      errormsg = ErrorHelper.checkErrorResponse(failure);
      setPostPageUtil(StatusUtil.error);
    }, (data) {
      isSuccess = data;
      setPostPageUtil(StatusUtil.success);
    });
  }
}
