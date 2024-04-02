import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/componets/sections/tv_sections/all_series_section.dart';
import 'package:movie_app/view/componets/sections/tv_sections/rating_series_section.dart';
import 'package:movie_app/view/componets/sections/tv_sections/trending_series_section.dart';
import 'package:movie_app/view/componets/widget_custom/view_all_button.dart';
import 'package:movie_app/view/screens/tv_screens/all_series_screen.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class TvScreen extends StatelessWidget {
  const TvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: SeriesCubit.get(context)
        ..getAllSeries()..getTrendingSeries()..getRatingSeries(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(right: 10, top: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              'جميع المسلسلات',
              style: Styles.textStyle22,
            ),
            const SizedBox(height: 10,),
            const AllSeriesSection(),
            const SizedBox(height: 30,),
            const Text(
              'مسلسلات رائجة هذا الاسبوع',
              style: Styles.textStyle22,
            ),
            const SizedBox(height: 10,),
            const TrendingSeriesSection(),
            const SizedBox(height: 30,),
            const Text(
              'مسلسلات اعلى تقييما',
              style: Styles.textStyle22,
            ),
            const SizedBox(height: 10,),
            const RatingSeriesSection(),
            const SizedBox(height: 30,),
            ViewAllButton(
              onPressed: () {
                navigationPushFunction(
                    context: context,
                    screen: const AllSeriesScreen()
                );
              },
              child: const Text(
                'عرض جميع المسلسلات',
                style: Styles.textStyle20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
