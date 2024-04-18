import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';

class ElevatedButtonCustom extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;
  const ElevatedButtonCustom({super.key, this.onPressed, required this.child,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor:AppColors.gray ,
          minimumSize: const Size(double.infinity,50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
          )
      ),
      child:child,
    );
  }
}
