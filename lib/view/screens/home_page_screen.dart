import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
        AppCubit appCubit=AppCubit.get(context);
        return Scaffold(
          body: appCubit.screens[appCubit.buttonNavigationBarIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: AppColors.appColor,
            selectedFontSize: 16,
            unselectedFontSize: 14,
            selectedIconTheme: const IconThemeData(size: 30),
            unselectedItemColor: AppColors.whiteColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: appCubit.buttonNavigationBarIndex,
            onTap: (int value){
              appCubit.changeIndexButtonNavigationBar(value);
            },
            items:  const [
              BottomNavigationBarItem(
                  icon:Icon(AppIcons.searchIcon) ,
                  label: 'البحث'
              ),
              BottomNavigationBarItem(
                  icon:Icon(AppIcons.watchedIcon) ,
                  label: 'المشاهدة'
              ),
              BottomNavigationBarItem(
                  icon:Icon(AppIcons.favBorderIcon) ,
                  label:'المفضلة'
              ),
              BottomNavigationBarItem(
                icon:Icon(AppIcons.homeIcon) ,
                label: 'الرئيسية',
              ),

            ],
          ),
        );
      },
    );
  }
}
