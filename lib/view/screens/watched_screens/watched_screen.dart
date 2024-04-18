import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/fav_and_watch_container_custom.dart';
import 'package:movie_app/view/screens/watched_screens/watched_movie_screen.dart';
import 'package:movie_app/view/screens/watched_screens/watched_series_screen.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';
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
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
            child: Column(
              children: [
                FavAndWatchContainerCustom(
                  text: 'قائمة الافلام',
                  onTap: (){
                    navigationPushFunction(
                      context: context,
                      screen:const WatchedMovieScreen() ,
                    );
                  },
                ),
                const SizedBox(height: 15,),
                FavAndWatchContainerCustom(
                  text: 'قائمة المسلسلات',
                  onTap: (){
                    navigationPushFunction(
                      context: context,
                      screen:const WatchedSeriesScreen() ,
                    );
                  },
                ),
              ],
            ),
          ) ,
      ),
    );
  }
}
