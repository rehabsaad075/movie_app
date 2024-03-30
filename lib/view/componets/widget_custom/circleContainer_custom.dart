import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class CircleContainerCustom extends StatelessWidget {
  const CircleContainerCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.gray
      ),
      child: const Text(
          'عائلى',
        style: Styles.textStyle18,
      ),
    );
  }
}
