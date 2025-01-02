import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/error_helper.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/core/utils/status_util.dart';
import 'package:provider_with_clean_architecture/features/ets/student/data/model/student_model.dart';
import 'package:provider_with_clean_architecture/features/ets/student/domain/entities/student_response_entity.dart';
import 'package:provider_with_clean_architecture/features/ets/student/domain/usecase/get_student_usecase.dart';
import 'package:provider_with_clean_architecture/features/ets/student/domain/usecase/student_usecase.dart';

class StudentProvider extends ChangeNotifier {
  StatusUtil _saveStudentStatus = StatusUtil.none,
      _getStudentStatus = StatusUtil.none;

  StudentUseCase studentUseCase;
  GetStudentUseCase getStudentUseCase;
  StudentProvider(
      {required this.studentUseCase, required this.getStudentUseCase});

  StatusUtil get saveStudentStatus => _saveStudentStatus;
  StatusUtil get gettudentStatus => _getStudentStatus;
  String? errorMsg, name, address, contact, gender;
  bool isSuccess = false;
  List<StudentResponseEntity>? studentList;

  setStudentStatus(StatusUtil value) {
    _saveStudentStatus = value;
    notifyListeners();
  }

  getStudentStatus(StatusUtil value) {
    _getStudentStatus = value;
    notifyListeners();
  }

  Future<void> saveStudent() async {
    if (_saveStudentStatus != StatusUtil.loading) {
      setStudentStatus(StatusUtil.loading);
    }
    StudentModel signupModel = StudentModel(
        name: name, address: address, contactNumber: contact, gender: gender);
    Either<Failure, bool> response =
        await studentUseCase(StudentParams(queryData: signupModel.toJson()));
    response.fold((failure) {
      errorMsg = ErrorHelper.checkErrorResponse(failure);
      setStudentStatus(StatusUtil.error);
    }, (data) {
      isSuccess = data;
      setStudentStatus(StatusUtil.success);
    });
  }

  Future<void> getStudent() async {
    if (_getStudentStatus != StatusUtil.loading) {
      getStudentStatus(StatusUtil.loading);
    }
    Either<Failure, List<StudentResponseEntity>> response =
        await getStudentUseCase(NoParams());
    response.fold((failure) {
      errorMsg = ErrorHelper.checkErrorResponse(failure);
      getStudentStatus(StatusUtil.error);
    }, (data) {
      studentList = data;
      getStudentStatus(StatusUtil.success);
    });
  }
}
