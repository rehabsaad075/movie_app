import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/fav_item_custom.dart';
import 'package:movie_app/view/screens/movie_screens/movie_details_screen.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class WatchedMovieScreen extends StatelessWidget {
  const WatchedMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'قائمة الافلام',
          ),
        ),
        body: BlocBuilder<MovieCubit, MovieStates>(
          builder: (context, state) {
            MovieCubit movieCubit =MovieCubit.get(context);
            return Visibility(
              visible: movieCubit.watchedMovie?.results?.isNotEmpty??true,
              replacement: const Center(
                  child: Text(
                    'لا توجد افلام فى قائمة المشاهدات حتى الان',
                    style: Styles.textStyle20,
                  )),
              child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return  FavItemCustom(
                      icon: AppIcons.deleteIcon,
                      results: movieCubit.watchedMovie?.results?[index]??Results(),
                      onIconPressed: () {
                        movieCubit.deleteWatchedMovie(index);
                      },
                      onTap: () {
                        movieCubit.changeMovieIndex(index);
                        movieCubit.getDetailsMovie(movieId: movieCubit.watchedMovie);
                        movieCubit.getSimilarMovies(movieId: movieCubit.watchedMovie);
                        navigationPushFunction(
                            context: context,
                            screen: const MovieDetailsScreen()
                        );
                      },
                    );
                  },
                  itemCount: movieCubit.watchedMovie?.results?.length??0
              ),
            );
          },
        ),
      ),
    );
  }
}
