import 'dart:convert';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/utils/info_helper.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';

class ErrorHelper {
  static String? checkErrorResponse(Failure failure) {
    String? errorMsg;
    if (failure is NetworkFailure) {
      errorMsg = pleaseCheckInternetStr;
    } else if (failure.errorCode == 404) {
      errorMsg = urlNotFound;
    } else if (failure is ServerFailure) {
      try {
        if (failure.message is Map &&
            jsonEncode(failure.message).contains("error_description")) {
          errorMsg = failure.message["error_description"];
        } else if (failure.message["detail"] is Map &&
            jsonEncode(failure.message["detail"]).contains("error")) {
          errorMsg = failure.message["detail"]["error"];
        } else {
          errorMsg = failure.message.toString();
        }
      } catch (e) {
        errorMsg = somethingWentWrongStr;
      }
    } else if (failure is SessionExpiredFailure) {
      sessionExpire();
    } else {
      errorMsg = failure.message;
    }
    return errorMsg;
  }

  static sessionExpire() {
    InfoHelper.showToast(sessionExpiredStr);
    //navigate to login page
  }
}
