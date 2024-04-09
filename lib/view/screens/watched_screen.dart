import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/fav_item_custom.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class WatchedScreen extends StatelessWidget {
  const WatchedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar:  AppBar(
            backgroundColor: AppColors.backColorSplash,
            titleSpacing: 20,
            title: Text(
              'قائمة المشاهدات',
              style: Styles.textStyle22.copyWith(color: AppColors.appColor),
            ),
          ),
          body: ListView.builder(
              padding: const EdgeInsets.all(15),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context,index){
                return  const FavItemCustom(
                  icon: AppIcons.deleteIcon,
                );
              },
              itemCount: 10
          )
      ),
    );
  }
}
