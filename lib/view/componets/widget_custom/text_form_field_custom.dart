import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';

class TextFormFieldCustom extends StatelessWidget {
  final TextEditingController? controller;
  const TextFormFieldCustom({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.appColor,
      controller: controller,
      decoration: InputDecoration(
        labelText: 'اضافة تقييم',
        labelStyle:  const TextStyle(
            color: AppColors.gr,
            fontSize: 18
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: AppColors.appColor
            )
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
                color: AppColors.appColor
            )
        ),
      ),
      keyboardType: TextInputType.number,
    );
  }
}
