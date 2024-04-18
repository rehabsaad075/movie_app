import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/componets/sections/movie_sections/all_movies_section.dart';
import 'package:movie_app/view/componets/sections/movie_sections/rating_movies_section.dart';
import 'package:movie_app/view/componets/sections/movie_sections/trending_movies_section.dart';
import 'package:movie_app/view/componets/widget_custom/elvated_button_custom.dart';
import 'package:movie_app/view/screens/movie_screens/all_movies_screen.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: MovieCubit.get(context)
          ..getAllMovies()..getTrendingMovies()..getRatingMovies(),
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(right: 10, top: 10),
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              'جميع الافلام',
              style: Styles.textStyle22,
            ),
            const SizedBox(height: 10,),
            const AllMoviesSection(),
            const SizedBox(height: 30,),
            const Text(
              'افلام رائجة هذا الاسبوع',
              style: Styles.textStyle22,
            ),
            const SizedBox(height: 10,),
            const TrendingMoviesSection(),
            const SizedBox(height: 30,),
            const Text(
              'الافلام الاعلى تقييما',
              style: Styles.textStyle22,
            ),
            const SizedBox(height: 10,),
            const RatingMoviesSection(),
            const SizedBox(height: 30,),
            ElevatedButtonCustom(
              onPressed: () {
                navigationPushFunction(
                    context: context,
                    screen: const AllMoviesScreen()
                );
              },
              child: const Text(
                'عرض جميع الافلام',
                style: Styles.textStyle20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}