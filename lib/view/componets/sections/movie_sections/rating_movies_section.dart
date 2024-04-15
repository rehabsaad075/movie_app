import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/image_custom.dart';
import 'package:movie_app/view/screens/movie_screens/movie_details_screen.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';

class RatingMoviesSection extends StatelessWidget {
  const RatingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        MovieCubit cubit = MovieCubit.get(context);
        return SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * .24,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ImageCustom(
                  results: cubit.ratingMoviesModel?.results?[index]?? Results(),
                  onTap: () {
                    cubit.changeMovieIndex(index);
                    cubit.getDetailsMovie(movieId: cubit.ratingMoviesModel);
                    cubit.getSimilarMovies(movieId: cubit.ratingMoviesModel);
                    navigationPushFunction(
                        context: context,
                        screen: const MovieDetailsScreen()
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15,),
              itemCount:cubit.ratingMoviesModel?.results?.length??0
          ),
        );
      },
    );
  }
}
