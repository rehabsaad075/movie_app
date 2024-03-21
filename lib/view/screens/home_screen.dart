import 'package:flutter/material.dart';
import 'package:movie_app/view/screens/movie_screen.dart';
import 'package:movie_app/view/screens/tv_screen.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16,horizontal: 6),
          child: Column(
            children: [
              TabBar(
                  labelColor: AppColors.appColor,
                  labelStyle: TextStyle(
                      fontSize: 20
                  ),
                  indicatorColor: AppColors.appColor,
                  tabs: [
                    Tab(
                      text: 'الافلام',
                    ),
                    Tab(
                      text: 'المسلسلات',
                    ),
                  ]
              ),
              Expanded(
                child: TabBarView(
                    children: [
                      MovieScreen(),
                      TvScreen()
                    ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
