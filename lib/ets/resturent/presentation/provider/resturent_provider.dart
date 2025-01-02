import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/error_helper.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/core/utils/status_util.dart';
import 'package:provider_with_clean_architecture/ets/resturent/data/model/resturent_model.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/entities/resturent_entities.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/use_cases/add_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/use_cases/delete_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/use_cases/edit_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/use_cases/get_resturent_usecase.dart';

class ResturentProvider extends ChangeNotifier {
  final ResturentUseCase resturentUseCase;
  final GetResturentUseCase getResturentUseCase;
  final DeleteResturentUseCase deleteResturentUseCase;
  final EditResturentUseCase editResturentUseCase;
  ResturentProvider(
      {required this.resturentUseCase,
      required this.getResturentUseCase,
      required this.deleteResturentUseCase,
      required this.editResturentUseCase});
  String? tableName, floor;
  int? tableNumber, numberOfSeats;
  String? errorMsg;
  bool? isSuccess;
  List<ResturentResponseEntity>? resturentList;

  StatusUtil addResturentStatus = StatusUtil.none;
  StatusUtil getResturentStatus = StatusUtil.none;
  StatusUtil deleteResturentStatus = StatusUtil.none;
  StatusUtil editResturentStatus = StatusUtil.none;

  TextEditingController tableNameController = TextEditingController();
  TextEditingController tableNumberController = TextEditingController();
  TextEditingController numberOfSeatsController = TextEditingController();
  TextEditingController floorController = TextEditingController();
  TextEditingController resturentIdController = TextEditingController();

  setAddResturent(StatusUtil statusUtil) {
    addResturentStatus = statusUtil;
    notifyListeners();
  }

  setGetResturent(StatusUtil statusUtil) {
    getResturentStatus = statusUtil;
    notifyListeners();
  }

  setDeleteResturent(StatusUtil statusUtil) {
    deleteResturentStatus = statusUtil;
    notifyListeners();
  }

  setEditResturent(StatusUtil statusUtil) {
    editResturentStatus = statusUtil;
    notifyListeners();
  }

  Future<void> addResturent() async {
    if (addResturentStatus != StatusUtil.loading) {
      setAddResturent(StatusUtil.loading);
    }
    ResturentModel signupModel = ResturentModel(
        restaurant_id: "o86MS",
        table_id: "string",
        tableName: tableNameController.text,
        floor: floorController.text,
        tableNumber: int.tryParse(tableNumberController.text),
        numberOfSeats: int.parse(numberOfSeatsController.text));
    Either<Failure, bool> response = await resturentUseCase(
        ResturentParams(queryData: signupModel.toJson()));
    response.fold((failure) {
      errorMsg = ErrorHelper.checkErrorResponse(failure);
      setAddResturent(StatusUtil.error);
    }, (data) {
      isSuccess = data;
      setAddResturent(StatusUtil.success);
    });
  }

  Future<void> getResturent() async {
    if (getResturentStatus != StatusUtil.loading) {
      setGetResturent(StatusUtil.loading);
    }
    Either<Failure, List<ResturentResponseEntity>> response =
        await getResturentUseCase(NoParams());
    response.fold((failure) {
      errorMsg = ErrorHelper.checkErrorResponse(failure);
      setGetResturent(StatusUtil.error);
    }, (data) {
      resturentList = data;
      setGetResturent(StatusUtil.success);
    });
  }

  Future<void> deleteResturent(String id) async {
    if (deleteResturentStatus != StatusUtil.loading) {
      setDeleteResturent(StatusUtil.loading);
    }
    Either<Failure, bool> response = await deleteResturentUseCase(id);
    response.fold((failure) {
      errorMsg = ErrorHelper.checkErrorResponse(failure);
      setDeleteResturent(StatusUtil.error);
    }, (data) {
      isSuccess = data;
      getResturent();
      setDeleteResturent(StatusUtil.success);
    });
  }

  Future<void> editResturent(String id) async {
    if (editResturentStatus != StatusUtil.loading) {
      setEditResturent(StatusUtil.loading);
    }
    ResturentModel signupModel = ResturentModel(
        restaurant_id: "o86MS",
        table_id: id,
        tableName: tableNameController.text,
        floor: floorController.text,
        tableNumber: int.tryParse(tableNumberController.text),
        numberOfSeats: int.tryParse(numberOfSeatsController.text));
    Either<Failure, bool> response = await editResturentUseCase(
        EditResturentParams(queryData: signupModel.toJson(), id: id));
    response.fold((failure) {
      errorMsg = ErrorHelper.checkErrorResponse(failure);
      setEditResturent(StatusUtil.error);
    }, (data) {
      isSuccess = data;
      setEditResturent(StatusUtil.success);
    });
  }
}
