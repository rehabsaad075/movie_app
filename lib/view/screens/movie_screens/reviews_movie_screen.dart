import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/reviews_details_item.dart';
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
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 16),
        children: [
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index){
                return const ReviewsDetailsItem();
              },
              separatorBuilder: (context,index)=>const SizedBox(height: 15,),
              itemCount: 5
          ),
          const SizedBox(height: 10,),
          TextButton(
            onPressed: (){},
            child: const Text(
            'عرض المزيد من التعليقات',
            style: Styles.textStyle20,
          ),
          )

        ],
      ),
    );
  }
}
