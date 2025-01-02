import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/error_helper.dart';
import 'package:provider_with_clean_architecture/core/utils/status_util.dart';
import 'package:provider_with_clean_architecture/features/ets/menu/data/model/menu_model.dart';

class MenuProvider extends ChangeNotifier {
  String? name, category, description, photo;
  String? errorMsg;
  int? price, cookingTime;
  bool? isSuccess;
  StatusUtil createMenuStatus = StatusUtil.none;

  setCreateMenu(StatusUtil statusUtil) {
    createMenuStatus = statusUtil;
    notifyListeners();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cookingTimeController = TextEditingController();

  Future<void> createMenu() async {
    if (createMenuStatus != StatusUtil.loading) {
      setCreateMenu(StatusUtil.loading);
    }
    MenuModel menuModel = MenuModel(
        name: nameController.text,
        category: categoryController.text,
        description: descriptionController.text,
        price: int.parse(priceController.text),
        cookingTime: int.parse(cookingTimeController.text));
    //        Either<Failure, bool> response = await resturentUseCase(
    //       ResturentParams(queryData: menuModel.toJson()));
    //   response.fold((failure) {
    //     errorMsg = ErrorHelper.checkErrorResponse(failure);
    //     setCreateMenu(StatusUtil.error);
    //   }, (data) {
    //     isSuccess = data;
    //     setCreateMenu(StatusUtil.success);
    //   });
    // }
// }
  }
}
