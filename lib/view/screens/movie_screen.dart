import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/sections/all_movies_section.dart';
import 'package:movie_app/view/componets/sections/rating_movies_section.dart';
import 'package:movie_app/view/componets/sections/trending_movies_section.dart';
import 'package:movie_app/view/componets/widget_custom/view_all_button.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(right: 10,top: 10),
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
          ViewAllButton(
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}