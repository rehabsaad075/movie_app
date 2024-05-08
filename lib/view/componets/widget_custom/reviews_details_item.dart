import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class ReviewsDetailsItem extends StatelessWidget {
  const ReviewsDetailsItem({super.key});

  @override
  Widget build(BuildContext context) {
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
                'Goddard',
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
                'Goddard',
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
            'Pretty awesome movie.  It shows what one crazy person can convince other crazy people to do.  Everyone needs something to believe in.  I recommend Jesus Christ, but they want Tyler Durden.',
            style: Styles.textStyle18.copyWith(
              color: AppColors.gr,
                fontWeight: FontWeight.normal
            ),
          ),
          const SizedBox(height: 5,),
          const Text(
            '2018-06-09',
            style: Styles.textStyle16,
          ),
        ],
      ),
    );
  }
}
