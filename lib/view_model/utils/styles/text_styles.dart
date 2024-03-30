import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';

abstract class Styles {
  static const textStyle40=TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w600,
    fontFamily: 'Charm',
    color: AppColors.whiteColor
  );
  static const textStyle22=TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      fontFamily: 'Charm',
  );

  static const textStyle20=TextStyle(
    fontSize: 20,
    color: AppColors.appColor,
    height: 1.2
  );

  static const textStyle30=TextStyle(
      fontSize: 30,
    fontFamily: 'Charm',
  );

  static const textStyle18=TextStyle(
    fontSize: 18,
    color: AppColors.appColor,
    fontWeight: FontWeight.w600
  );
}