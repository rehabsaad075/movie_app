import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/elvated_button_custom.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class FavAndWatchItem extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final IconData icon;
  const FavAndWatchItem({super.key, this.onPressed, required this.text, required this.icon,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButtonCustom(
      onPressed:onPressed ,
        child:  Row(
          children: [
            Text(
              text,
              style: Styles.textStyle18,
            ),
            const SizedBox(width: 5,),
            Icon(
              icon,
              color: AppColors.appColor,
              size: 23,
            )
          ],
        ),
    );
  }
}
// Row(
// children: [
// SizedBox(
// width: 165,
// child: ElevatedButtonCustom(
// onPressed:onWatchPressed ,
// child:  const Row(
// children: [
// Text(
// 'المشاهدة لاحقا',
// style: Styles.textStyle18,
// ),
// SizedBox(width: 5,),
// Icon(
// AppIcons.addIcon,
// color: AppColors.appColor,
// size: 25,
// )
// ],
// ),
// ),
// ),
// const SizedBox(width: 20,),
// SizedBox(
// width: 185,
// child: ElevatedButtonCustom(
// onPressed: onFavPressed,
// child:  const Row(
// children: [
// Text(
// 'اضافة الى المفضلة',
// style: Styles.textStyle18,
// ),
// SizedBox(width: 5,),
// Icon(
// AppIcons.favBorderIcon,
// color: AppColors.appColor,
// size: 23,
// )
// ],
// ),
// ),
// ),
// ],
//);