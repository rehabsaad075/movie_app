import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class SearchItemCustom extends StatelessWidget {
  final void Function()? onTap;
  const SearchItemCustom({super.key, this.onTap, });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: NetworkImage('https://image.tmdb.org/t/p/w500/9GVcJJ0MPl7aMhLSz9Nr8Mz3YG2.jpg'),
                fit: BoxFit.fill
              ),
              borderRadius: BorderRadius.circular(12)
            ),
            height: 100,
            width: 100,
          ),
          const SizedBox(width: 15,),
           Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
              Text(
                  'good father',
                style: Styles.textStyle20.copyWith(color: AppColors.whiteColor),
              ),
              const SizedBox(height: 5,),
              const Row(
                children: [
                  Text(
                    '7.2',
                    style: Styles.textStyle16
                  ),
                  SizedBox(width: 3,),
                  Icon(
                    AppIcons.starIcon,
                    color: AppColors.appColor,
                    size: 18,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
