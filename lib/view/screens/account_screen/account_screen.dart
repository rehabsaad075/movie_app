import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/fav_and_watch_container_custom.dart';
import 'package:movie_app/view/screens/account_screen/rating_movie_screen.dart';
import 'package:movie_app/view/screens/account_screen/rating_tv_screen.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(right: 24),
            child: Text(
              'الاعدادات'
            ),
          ),
        ),
        body:  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
          child: Column(
            children: [
              FavAndWatchContainerCustom(
                text: 'تقييمك للافلام ',
                onTap: (){
                  navigationPushFunction(
                    context: context,
                    screen:const RatingMovieScreen() ,
                  );
                  MovieCubit.get(context).getRatedMovie();
                },
              ),
              const SizedBox(height: 15,),
              FavAndWatchContainerCustom(
                text: 'تقييمك للمسلسلات ',
                onTap: (){
                  navigationPushFunction(
                    context: context,
                    screen:const RatingTvScreen() ,
                  );
                  SeriesCubit.get(context).getRatedTv();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
