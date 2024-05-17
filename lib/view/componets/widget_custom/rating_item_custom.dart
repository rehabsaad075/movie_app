import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class RatingItemCustom extends StatelessWidget {
  final String text;
  const RatingItemCustom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            height: 120,
            width: 120,
            child: CachedNetworkImage(
              imageUrl: 'https://image.tmdb.org/t/p/w500/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg',
              fit: BoxFit.fill,
              placeholder: (context, url) =>
                  Container(
                    color: AppColors.gray,
                  ),
              errorWidget: (context, url, error) =>
                  Container(
                    color: AppColors.gray,
                    child: const Icon(
                      AppIcons.errorIcon,
                      color: AppColors.appColor,
                    ),
                  ),
            ),
          ),
        ),
        const SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Fight Club',
              style: Styles.textStyle20.copyWith(color: AppColors.whiteColor),
            ),
            const SizedBox(height: 5,),
            Row(
              children: [
                Text(
                  text,
                  style: Styles.textStyle18.copyWith(
                      color: AppColors.white70,
                      fontWeight: FontWeight.normal
                  ),
                ),
                const SizedBox(width: 10,),
                const Icon(
                  AppIcons.starIcon,
                  color: AppColors.appColor,
                  size: 18,
                ),
                const SizedBox(width: 3,),
                Text(
                  '7.2',
                 // cubit.detailsMovie?.voteAverage?.toStringAsFixed(1).toString()??'',
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
                  'تقييمك ',
                  style: Styles.textStyle18.copyWith(
                      color: AppColors.white70,
                      fontWeight: FontWeight.normal
                  ),
                ),
                const SizedBox(width: 10,),
                const Icon(
                  AppIcons.starIcon,
                  color: AppColors.appColor,
                  size: 18,
                ),
                const SizedBox(width: 3,),
                Text(
                  '6.2',
                  // cubit.detailsMovie?.voteAverage?.toStringAsFixed(1).toString()??'',
                  style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.normal
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
