import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class FavAndWatchContainerCustom extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  const FavAndWatchContainerCustom({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
                color: AppColors.appColor,
                width: 0.8
            )
        ),
        child:  Row(
          children: [
            Text(
              text,
              style: Styles.textStyle20.copyWith(color: AppColors.gr),
            ),
            const Spacer(),
            const Icon(
              AppIcons.arrowIcon,
              color: AppColors.gr,
            )
          ],
        ),
      ),
    );
  }
}
