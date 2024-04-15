import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/image_custom.dart';
import 'package:movie_app/view/screens/tv_screens/series_details_screen.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';

class SimilarSeriesSection extends StatelessWidget {
  const SimilarSeriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: SeriesCubit.get(context)
        ..getSimilarSeries(),
      child: BlocBuilder<SeriesCubit, SeriesStates>(
        builder: (context, state) {
          SeriesCubit cubit = SeriesCubit.get(context);
          return SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height * .21,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ImageCustom(
                    results: cubit.similarSeries?.results?[index] ?? Results(),
                    onTap: () {
                      cubit.changeSeriesIndex(index);
                      cubit.getDetailsSeries(seriesModel: cubit.similarSeries);
                      cubit.getSimilarSeries(seriesModel: cubit.similarSeries);
                      navigationPushFunction(
                          context: context,
                          screen: const SeriesDetailsScreen()
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(width: 15,),
                itemCount: cubit.similarSeries?.results?.length ?? 0
            ),
          );
        },
      ),
    );
  }
}