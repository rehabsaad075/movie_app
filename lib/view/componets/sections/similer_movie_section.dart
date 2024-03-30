import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/image_custom.dart';
import 'package:movie_app/view/screens/details_screen.dart';
import 'package:movie_app/view_model/cubits/movie_app_cubit/movie_app_cubit.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';

class SimilarMovieSection extends StatelessWidget {
  const SimilarMovieSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieAppCubit, MovieAppStates>(
      builder: (context, state) {
        MovieAppCubit cubit = MovieAppCubit.get(context);
        return SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * .21,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  ImageCustom(
                  results: cubit.allMoviesModel?.results?[index]??Results(),
                  onTap: (){
                    navigationPushFunction(context: context,
                        screen: const DetailsScreen()
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15,),
              itemCount: cubit.allMoviesModel?.results?.length??0
          ),
        );
      },
    );
  }
}