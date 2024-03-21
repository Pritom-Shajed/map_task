import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task/utils/constants/constants.dart';
import 'package:task/utils/styles/dimensions.dart';

class AppToasts {
  AppToasts._();

  static void shortToast (message){
     Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: AppColors.baseColor,
        textColor: Colors.white,
        fontSize: Dimensions.fontSize12,
    );
  }
}