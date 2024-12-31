import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class InfoHelper {
  static void showToast(String? message) {
    Fluttertoast.showToast(
      msg: "$message",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
    );
  }

  static void showErrorToast(BuildContext context, String message) {
    CherryToast.error(
      inheritThemeColors: true,
      title: Text(
        message,
        textAlign: TextAlign.center,
      ),
      animationType: AnimationType.fromRight,
      actionHandler: () {},
      toastDuration: const Duration(milliseconds: 2000),
    ).show(context);
  }

  static void showSuccessToast(BuildContext context, String message) {
    CherryToast.success(
      inheritThemeColors: true,
      title: Text(
        message,
        textAlign: TextAlign.center,
      ),
      animationType: AnimationType.fromRight,
      toastDuration: const Duration(milliseconds: 1600),
    ).show(context);
  }
}
