import 'package:flutter/material.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class FavItemCustom extends StatelessWidget {
  final IconData icon;
  const FavItemCustom({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              image:  const DecorationImage(
                  image: NetworkImage('https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg'),
                  fit: BoxFit.fill
              ),
              borderRadius: BorderRadius.circular(12)
          ),
          height: 120,
          width: 120,
        ),
        const SizedBox(width: 15,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'trolls',
                style: Styles.textStyle20.copyWith(color: AppColors.whiteColor),
              ),
              const SizedBox(height: 5,),
              const Text(
                  'في النسخة الجديدة من فيلم كلاسيكي من الثمانينيات، المقاتل السابق في بطولة القتال النهائي دالتون ، يقبل بوظيفة كحارس في حانة على الطريق في فلوريدا كيز، ليكتشف أن هذه الجنة ليست كما تبدو عليه',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5,),
               Row(
                children: [
                  const Text(
                      '7.9',
                      style: Styles.textStyle16
                  ),
                  const SizedBox(width: 3,),
                  const Icon(
                    AppIcons.starIcon,
                    color: AppColors.appColor,
                    size: 18,
                  ),
                  const SizedBox(width: 130,),
                  IconButton(
                    onPressed: () {

                    },
                    icon: Icon(
                      icon,
                      color: AppColors.appColor,
                      size: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
