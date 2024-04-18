import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/details_model.dart';
import 'package:movie_app/view/componets/widget_custom/circleContainer_custom.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';

class GenresSeriesSection extends StatelessWidget {
  const GenresSeriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesCubit, SeriesStates>(
      builder: (context, state) {
        SeriesCubit cubit = SeriesCubit.get(context);
        return SizedBox(
          height: 40,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CircleContainerCustom(
                  genres: cubit.detailsSeries?.genres?[index]??Genres(),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15,),
              itemCount: cubit.detailsSeries?.genres?.length??0
          ),
        );
      },
    );
  }
}
