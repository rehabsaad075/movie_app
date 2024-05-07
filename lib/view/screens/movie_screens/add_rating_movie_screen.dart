import 'package:flutter/material.dart';
import 'package:movie_app/view/componets/widget_custom/elvated_button_custom.dart';
import 'package:movie_app/view/componets/widget_custom/text_form_field_custom.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class AddRatingMovieScreen extends StatelessWidget {
  const AddRatingMovieScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backColorSplash,
          titleSpacing: 0,
          iconTheme: const IconThemeData(
            color: AppColors.appColor,
            size: 25,
          ),
          title: Text(
            'اضافة تقييم',
            style: Styles.textStyle22.copyWith(color: AppColors.appColor),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 30),
          child: Column(
            children: [
              const TextFormFieldCustom(),
              const SizedBox(height: 30,),
              ElevatedButtonCustom(
                onPressed: (){},
                  child: const Text(
                    'اضافة تقييم',
                    style: Styles.textStyle18,
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
