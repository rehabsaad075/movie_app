import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/functions/alertDialog_function.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class RatingItemCustom extends StatelessWidget {
  final String text;
  final Results results;
  final int currentIndex;
  final void Function()? onPressedDelete;
  const RatingItemCustom({
    super.key,
    required this.text,
    required this.results,
    required this.currentIndex,
    required this.onPressedDelete,
  });

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
                    results.voteAverage?.toStringAsFixed(1).toString()??'',
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
                    results.rating?.toStringAsFixed(1).toString()??'',
                    style: Styles.textStyle18.copyWith(
                        fontWeight: FontWeight.normal
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: (){
                        MovieCubit.get(context).changeMovieIndex(currentIndex);
                        alertDialogFunction(
                            context: context,
                            title: 'حذف التقييم',
                            subTitle: 'هل تريد بالفعل حذف تقييمك',
                            textValueButton: 'حذف',
                            onPressed: onPressedDelete
                        );
                      },
                      icon: const Icon(
                          AppIcons.deleteIcon,
                        color: AppColors.appColor,
                      )
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
