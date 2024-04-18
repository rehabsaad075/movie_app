import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/fav_item_custom.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class WatchedMovieScreen extends StatelessWidget {
  const WatchedMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backColorSplash,
          iconTheme: const IconThemeData(
              color: AppColors.appColor
          ),
          title: Text(
            'قائمة الافلام',
            style: Styles.textStyle22.copyWith(color: AppColors.appColor),
          ),
        ),
        body: BlocBuilder<MovieCubit, MovieStates>(
          builder: (context, state) {
            MovieCubit movieCubit =MovieCubit.get(context);
            return Visibility(
              visible: movieCubit.watchedMovie?.results?.isNotEmpty??true,
              replacement: const Center(
                  child: Text(
                    'لا توجد افلام فى قائمة المشاهدات حتى الان',
                    style: Styles.textStyle20,
                  )),
              child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return  FavItemCustom(
                      icon: AppIcons.deleteIcon,
                      results: movieCubit.watchedMovie?.results?[index]??Results(),
                    );
                  },
                  itemCount: movieCubit.watchedMovie?.results?.length??0
              ),
            );
          },
        ),
      ),
    );
  }
}
