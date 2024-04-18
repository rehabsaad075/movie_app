import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';

Future<bool?> showToast({required String msg,Color?color}) async {
  return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor:color??AppColors.backColorSplash,
        textColor:AppColors.appColor,
        fontSize: 16.0
  );
}