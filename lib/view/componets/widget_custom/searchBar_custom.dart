import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const SearchBar(
      padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 10)
      ),
      hintText: 'البحث عن افلام ومسلسلات',
      hintStyle: MaterialStatePropertyAll(
          TextStyle(
              color: AppColors.white70,
              fontSize: 18
          )
      ),
      textStyle: MaterialStatePropertyAll(
          TextStyle(
              color: AppColors.appColor,
              fontSize: 20
          )
      ),
      trailing:[
        Icon(
          AppIcons.searchIcon,
          color: AppColors.white70,
        ),
      ] ,
      elevation: MaterialStatePropertyAll(0),
    );
  }
}
