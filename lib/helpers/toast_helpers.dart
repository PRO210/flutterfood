import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FlutterFoodToast {
  static void error(String msg,
      {toastLength = Toast.LENGTH_SHORT, gravity = ToastGravity.CENTER}) {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: toastLength,
        gravity: gravity,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
