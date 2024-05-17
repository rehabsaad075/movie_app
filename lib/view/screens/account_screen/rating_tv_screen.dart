import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/rating_item_custom.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
class RatingTvScreen extends StatelessWidget {
  const RatingTvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<SeriesCubit, SeriesStates>(
          builder: (context, state) {
            SeriesCubit seriesCubit=SeriesCubit.get(context);
            return ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return RatingItemCustom(
                  text: 'تقييم المسلسل',
                  results: seriesCubit.ratedTv?.results?[index]??Results(),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10,);
              },
              itemCount: seriesCubit.ratedTv?.results?.length??0,
            );
          },
        ),
      ),
    );
  }
}
