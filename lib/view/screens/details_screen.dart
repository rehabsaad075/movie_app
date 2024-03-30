import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/sections/genres_section.dart';
import 'package:movie_app/view/componets/sections/similer_movie_section.dart';
import 'package:movie_app/view/componets/widget_custom/image_details_custom.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 8),
          physics: const BouncingScrollPhysics(),
          children: [
            const ImageDetailsCustom(),
            const SizedBox(
              height: 20,
            ),
            const Text(
                'Kung Fu Panda 4',
              style: Styles.textStyle30,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
              'المغامرات الإضافية لبو واسع العينين في الصين القديمة ، الذي لا يضاهي حبه للكونغ فو سوى شهية لا تشبع',
              style: Styles.textStyle20.copyWith(color: AppColors.white70),
               //textDirection: TextDirection.rtl,
            ),
            const SizedBox(
              height: 30,
            ),
            const GenresSection(),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'تقييم الفيلم',
                  style: Styles.textStyle18.copyWith(
                      color: AppColors.white70,
                      fontWeight: FontWeight.normal
                  ),
                ),
                const SizedBox(width: 15,),
                Text(
                  '6.9',
                  style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.normal
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'تاريخ الانتاج',
                  style: Styles.textStyle18.copyWith(
                      color: AppColors.white70,
                      fontWeight: FontWeight.normal
                  ),
                ),
                const SizedBox(width: 15,),
                Text(
                  '2024-03-02',
                  style: Styles.textStyle18.copyWith(
                      fontWeight: FontWeight.normal
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'افلام قد تعجبك',
              style: Styles.textStyle20.copyWith(color: AppColors.whiteColor),
            ),
            const SizedBox(
              height: 10,
            ),
            const SimilarMovieSection()
          ],
        ),
      ),
    );
  }
}
//1011985
