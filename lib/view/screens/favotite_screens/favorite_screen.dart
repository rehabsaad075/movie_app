import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/fav_and_watch_container_custom.dart';
import 'package:movie_app/view/screens/favotite_screens/fav_movie_screen.dart';
import 'package:movie_app/view/screens/favotite_screens/fav_series_screen.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar:  AppBar(
            title: const Padding(
              padding: EdgeInsets.only(right: 24),
              child: Text(
                'المفضلة',
              ),
            ),
          ),
          body:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
            child: Column(
              children: [
                FavAndWatchContainerCustom(
                  text: 'الافلام المفضلة',
                  onTap: (){
                    navigationPushFunction(
                      context: context,
                      screen:const FavMovieScreen() ,
                    );
                    MovieCubit.get(context).getFavMovie();
                  },
                ),
                const SizedBox(height: 15,),
                FavAndWatchContainerCustom(
                  text: 'المسلسلات المفضلة',
                  onTap: (){
                    navigationPushFunction(
                      context: context,
                      screen:const FavSeriesScreen() ,
                    );
                    SeriesCubit.get(context).getFavTv();
                  },
                ),
              ],
            ),
          ) ,
      ),
    );
  }
}
