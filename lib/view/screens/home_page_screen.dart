import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view_model/cubits/movie_app_cubit/movie_app_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieAppCubit,MovieAppStates>(
      builder: (context, state) {
        MovieAppCubit movieAppCubit=MovieAppCubit.get(context);
        return Scaffold(
          body: movieAppCubit.screens[movieAppCubit.buttonNavigationBarIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.appColor,
            selectedFontSize: 16,
            unselectedFontSize: 14,
            selectedIconTheme: const IconThemeData(size: 30),
            unselectedItemColor: AppColors.whiteColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: movieAppCubit.buttonNavigationBarIndex,
            onTap: (int value){
              movieAppCubit.changeIndexButtonNavigationBar(value);
            },
            items:  const [
              BottomNavigationBarItem(
                icon:Icon(AppIcons.homeIcon) ,
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                  icon:Icon(AppIcons.favIcon) ,
                  label:'المفضلة'
              ),
              BottomNavigationBarItem(
                  icon:Icon(AppIcons.watchedIcon) ,
                  label: 'المشاهدة'
              ),
              BottomNavigationBarItem(
                  icon:Icon(AppIcons.searchIcon) ,
                  label: 'البحث'
              ),
            ],
          ),
        );
      },
    );
  }
}
