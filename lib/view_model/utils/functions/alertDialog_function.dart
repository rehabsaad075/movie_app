
import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

void alertDialogFunction({
  required context,
  required String title,
  required String subTitle,
  required String textValueButton,
  required void Function()? onPressed
}){
  showDialog(
      context: context,
      builder: (context)=>Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: Row(
            children: [
              const Icon(
                AppIcons.deleteIcon,
                color: AppColors.appColor,
              ),
              const SizedBox(width: 10,),
              Text(
                title,
              ),
            ],
          ),
          content:  Text(
              subTitle,
          ),
          titlePadding: const EdgeInsets.only(top: 24,left: 24,bottom: 6,right: 24),
          contentPadding: const EdgeInsets.symmetric(horizontal: 24,vertical: 12),
          actionsPadding: const EdgeInsets.only(bottom: 12,right: 24,left: 12),
          backgroundColor: AppColors.backColorSplash,
          titleTextStyle: Styles.textStyle18,
          contentTextStyle: Styles.textStyle16.copyWith(color: AppColors.whiteColor),
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: const Text(
                    'الغاء',
                  style: Styles.textStyle16,
                )
            ),
            TextButton(
                onPressed:onPressed ,
                child: Text(
                   textValueButton ,
                  style: Styles.textStyle16,
                )
            ),
          ],
        ),
      )
  );
}