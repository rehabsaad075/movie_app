import 'package:flutter/material.dart';
import 'package:movie_app/models/details_model.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class CircleContainerCustom extends StatelessWidget {
  final Genres genres;
  const CircleContainerCustom({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 65,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColors.gray
      ),
      child:  Text(
          genres.name??'',
        style: Styles.textStyle18,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
