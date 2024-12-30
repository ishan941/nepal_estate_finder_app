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
}
