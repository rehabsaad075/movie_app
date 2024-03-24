import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class ViewAllButton extends StatelessWidget {
  final void Function()? onPressed;
  const ViewAllButton({super.key, this.onPressed,});

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
      child:const Text(
          'عرض الجميع',
        style: Styles.textStyle20,
      ),
    );
  }
}
