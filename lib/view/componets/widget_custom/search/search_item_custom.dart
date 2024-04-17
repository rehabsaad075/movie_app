import 'package:flutter/material.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class SearchItemCustom extends StatelessWidget {
  final void Function()? onTap;
  final Results results;
  const SearchItemCustom({super.key, this.onTap, required this.results, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              image:  DecorationImage(
                image: NetworkImage('${EndPoints.imageUrl}${results.posterPath}'),
                fit: BoxFit.fill
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            height: 100,
            width: 100,
          ),
          const SizedBox(width: 15,),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Text(
                   results.title??'',
                  style: Styles.textStyle20.copyWith(color: AppColors.whiteColor),
                ),
                const SizedBox(height: 5,),
                 Row(
                  children: [
                    Text(
                      results.voteAverage?.toStringAsFixed(1).toString()??'',
                      style: Styles.textStyle16
                    ),
                    const SizedBox(width: 3,),
                    const Icon(
                      AppIcons.starIcon,
                      color: AppColors.appColor,
                      size: 18,
                    ),
                  ],
                )
              ],
          ),
           )
        ],
      ),
    );
  }
}
