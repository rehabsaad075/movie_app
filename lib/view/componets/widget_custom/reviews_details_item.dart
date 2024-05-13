import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:movie_app/models/reviews_model.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class ReviewsDetailsItem extends StatelessWidget {
  final Results reviewsResults;
  const ReviewsDetailsItem({super.key, required this.reviewsResults, });

  @override
  Widget build(BuildContext context) {
    DateTime date=DateFormat('yyyy-MM-dd').parse(reviewsResults.createdAt ?? '');
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.appColor
        )
      ),
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'auther : ',
                style: Styles.textStyle18.copyWith(
                    color: AppColors.white70,
                  fontWeight: FontWeight.normal
                ),
              ),
              Text(
                reviewsResults.author??'',
                style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Row(
            children: [
              Text(
                'userName : ',
                style: Styles.textStyle18.copyWith(
                    color: AppColors.white70,
                    fontWeight: FontWeight.normal
                ),
              ),
              Text(
                reviewsResults.authorDetails?.username??'',
                style: Styles.textStyle18.copyWith(
                    fontWeight: FontWeight.normal
                ),
              ),
            ],
          ),
          const SizedBox(height: 5,),
          Text(
            'content : ',
            style: Styles.textStyle18.copyWith(
                fontWeight: FontWeight.normal
            ),
          ),
          const SizedBox(height: 5,),
          Text(
            reviewsResults.content??'',
            style: Styles.textStyle18.copyWith(
              color: AppColors.gr,
                fontWeight: FontWeight.normal
            ),
          ),
          const SizedBox(height: 5,),
           Text(
             '$date',
            style: Styles.textStyle16,
          ),
        ],
      ),
    );
  }
}
//DateTime.parse(reviewsResults.createdAt ?? '')