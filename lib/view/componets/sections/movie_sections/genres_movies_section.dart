import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/details_model.dart';
import 'package:movie_app/view/componets/widget_custom/circleContainer_custom.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';

class GenresMoviesSection extends StatelessWidget {
  const GenresMoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        MovieCubit cubit = MovieCubit.get(context);
        return SizedBox(
          height: 40,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CircleContainerCustom(
                  genres: cubit.detailsMovie?.genres?[index]??Genres(),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15,),
              itemCount: cubit.detailsMovie?.genres?.length??0
          ),
        );
      },
    );
  }
}
