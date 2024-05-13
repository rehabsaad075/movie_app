import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/reviews_model.dart';
import 'package:movie_app/view/componets/widget_custom/reviews_details_item.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class ReviewsTvScreen extends StatelessWidget {
  const ReviewsTvScreen({super.key});

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
      body: BlocBuilder<SeriesCubit, SeriesStates>(
        builder: (context, state) {
          SeriesCubit seriesCubit=SeriesCubit.get(context);
          if(state is GetReviewsSeriesLoadingState){
            return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.appColor,
                )
            );
          }
          else if((seriesCubit.reviewsTv?.results??[]).isNotEmpty){
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                itemBuilder: (context, index) {
                  return ReviewsDetailsItem(
                    reviewsResults:seriesCubit.reviewsTv?.results?[index]??Results(),
                  );
                },
                separatorBuilder: (context, index) =>
                const SizedBox(height: 15,),
                itemCount: seriesCubit.reviewsTv?.results?.length??0
            );
          }
          else{
            return const Center(
              child: Text(
                  'لا توجد تعليقات على هذا المسلسل',
                style: Styles.textStyle20,
              ),
            );
          }
        },
      ),
    );
  }
}
