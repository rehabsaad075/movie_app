import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class FavItemCustom extends StatelessWidget {
  final IconData icon;
  final Results results;
  final void Function()? onIconPressed;
  final void Function()? onTap;
  const FavItemCustom({
    super.key,
    required this.icon,
    required this.results,
    required this.onIconPressed,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
         ClipRRect(
           borderRadius: BorderRadius.circular(12),
           child: SizedBox(
             height: 120,
             width: 120,
             child: CachedNetworkImage(
                 imageUrl: '${EndPoints.imageUrl}/${results.posterPath}',
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  results.originalTitle??'',
                  style: Styles.textStyle20.copyWith(color: AppColors.whiteColor),
                ),
                const SizedBox(height: 5,),
                 Text(
                  results.overview??'',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5,),
                 Row(
                  children: [
                     Text(
                        results.voteAverage?.toStringAsFixed(1).toString()??'',
                        style: Styles.textStyle18.copyWith(fontWeight: FontWeight.normal)
                    ),
                    const SizedBox(width: 3,),
                    const Icon(
                      AppIcons.starIcon,
                      color: AppColors.appColor,
                      size: 20,
                    ),
                    const SizedBox(width: 130,),
                    IconButton(
                      onPressed: onIconPressed,
                      icon: Icon(
                        icon,
                        color: AppColors.appColor,
                        size: 25,
                      ),
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
