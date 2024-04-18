import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/elvated_button_custom.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class FavAndWatchItem extends StatelessWidget {
  final void Function()? onWatchPressed;
  final void Function()? onFavPressed;
  const FavAndWatchItem({super.key, this.onWatchPressed, this.onFavPressed});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        SizedBox(
          width: 165,
          child: ElevatedButtonCustom(
            onPressed:onWatchPressed ,
            child:  const Row(
              children: [
                Text(
                  'المشاهدة لاحقا',
                  style: Styles.textStyle18,
                ),
                SizedBox(width: 5,),
                Icon(
                  AppIcons.addIcon,
                  color: AppColors.appColor,
                  size: 25,
                )
              ],
            ),
          ),
        ),
        const SizedBox(width: 20,),
        SizedBox(
          width: 185,
          child: ElevatedButtonCustom(
            onPressed: onFavPressed,
            child: const Row(
              children: [
                Text(
                  'اضافة الى المفضلة',
                  style: Styles.textStyle18,
                ),
                SizedBox(width: 5,),
                Icon(
                  AppIcons.favIcon,
                  color: AppColors.appColor,
                  size: 23,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
