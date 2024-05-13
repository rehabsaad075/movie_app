import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/reviews_model.dart';
import 'package:movie_app/view/componets/widget_custom/reviews_details_item.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class ReviewsMovieScreen extends StatelessWidget {
  const ReviewsMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backColorSplash,
        titleSpacing: 0,
        iconTheme: const IconThemeData(
          color: AppColors.appColor,
          size: 25,
        ),
        title: Text(
          ' Reviews',
          style: Styles.textStyle22.copyWith(color: AppColors.appColor),
        ),
      ),
      body: BlocBuilder<MovieCubit, MovieStates>(
        builder: (context, state) {
          MovieCubit movieCubit=MovieCubit.get(context);
          if(state is GetReviewsMovieLoadingState){
            return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.appColor,
                )
            );
          }
          else if((movieCubit.reviewsMovie?.results??[]).isNotEmpty){
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                itemBuilder: (context, index) {
                  return ReviewsDetailsItem(
                    reviewsResults:movieCubit.reviewsMovie?.results?[index]??Results(),
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(height: 15,),
                itemCount: movieCubit.reviewsMovie?.results?.length??0
            );
          }
          else{
            return const Center(
              child: Text(
                'لا توجد تعليقات على هذا الفيلم',
                style: Styles.textStyle20,
              ),
            );
          }
        },
      ),
    );
  }
}
