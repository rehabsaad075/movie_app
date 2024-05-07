import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/componets/widget_custom/image_watch_provider_logo_item.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';

class FlatrateMovieList extends StatelessWidget {
  const FlatrateMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        MovieCubit cubit = MovieCubit.get(context);
        return SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.08,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return  ImageWatchProviderLogoItem(
                  logoPath: cubit.watchProviderModel?.results?.eG?.flatrate?[index].logoPath??'',
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10,),
              itemCount: cubit.watchProviderModel?.results?.eG?.flatrate?.length??0
          ),
        );
      },
    );
  }
}