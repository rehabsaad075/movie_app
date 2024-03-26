import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/image_custom.dart';
import 'package:movie_app/view_model/cubits/movie_app_cubit/movie_app_cubit.dart';

class TrendingMoviesSection extends StatelessWidget {
  const TrendingMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieAppCubit, MovieAppStates>(
      builder: (context, state) {
        MovieAppCubit cubit = MovieAppCubit.get(context);
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
                  results: cubit.trendingMovies?.results?[index] ?? Results(),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15,),
              itemCount: cubit.trendingMovies?.results?.length ?? 0
          ),
        );
      },
    );
  }
}
