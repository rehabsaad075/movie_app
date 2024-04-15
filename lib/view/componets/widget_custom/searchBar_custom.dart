import 'package:flutter/material.dart';
import 'package:movie_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 10)
      ),
      hintText: 'البحث عن افلام ومسلسلات',
      hintStyle: const MaterialStatePropertyAll(
          TextStyle(
              color: AppColors.white70,
              fontSize: 18
          )
      ),
      textStyle: const MaterialStatePropertyAll(
          TextStyle(
              color: AppColors.appColor,
              fontSize: 20
          )
      ),
      trailing:const [
        Icon(
          AppIcons.searchIcon,
          color: AppColors.white70,
        ),
      ] ,
      elevation: const MaterialStatePropertyAll(0),
      onChanged: (value){
        AppCubit.get(context).searchOfResults(movieName: value);
      },
    );
  }
}
