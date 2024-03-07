import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void showFlushbar(BuildContext context, String title, String massage) {
    Flushbar(
      duration: const Duration(seconds: 3),
      title: title,
      message: massage,
    ).show(context);
  }

  static void showToast(String massage) {
    Fluttertoast.showToast(
      msg: massage,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
