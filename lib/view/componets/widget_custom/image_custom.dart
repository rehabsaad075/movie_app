import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';

class ImageCustom extends StatelessWidget {
  final Results results;
  const ImageCustom({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 3.1/4.3,
        child: CachedNetworkImage(
          imageUrl: '${EndPoints.imageUrl}${results.posterPath}',
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
    );
  }
}
