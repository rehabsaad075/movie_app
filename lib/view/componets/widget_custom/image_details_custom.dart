import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';

class ImageDetailsCustom extends StatelessWidget {
  const ImageDetailsCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 2/1.4,
        child: CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500/kDp1vUBnMpe8ak4rjgl3cLELqjU.jpg',
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
