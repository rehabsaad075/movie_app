import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/rating_item_custom.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';

class RatingMovieScreen extends StatelessWidget {
  const RatingMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<MovieCubit, MovieStates>(
          builder: (context, state) {
            MovieCubit movieCubit=MovieCubit.get(context);
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return  RatingItemCustom(
                  text: 'تقييم الفيلم',
                  results: movieCubit.ratedMovie?.results?[index]??Results(),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10,);
              },
              itemCount: movieCubit.ratedMovie?.results?.length??0,
            );
          },
        ),
      ),
    );
  }
}
