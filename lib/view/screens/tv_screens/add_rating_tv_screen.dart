import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/componets/widget_custom/elvated_button_custom.dart';
import 'package:movie_app/view/componets/widget_custom/text_form_field_custom.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class AddRatingTvScreen extends StatelessWidget {
  const AddRatingTvScreen({super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
          child: Column(
            children: [
              TextFormFieldCustom(
                controller: SeriesCubit
                    .get(context)
                    .controller,
              ),
              const SizedBox(height: 30,),
              BlocBuilder<SeriesCubit, SeriesStates>(
                builder: (context, state) {
                  return Visibility(
                    visible:state is AddRatingSeriesLoadingState,
                    replacement:  ElevatedButtonCustom(
                      onPressed: () {
                        SeriesCubit.get(context).addRatingTv();
                      },
                      child: const Text(
                        'اضافة تقييم',
                        style: Styles.textStyle18,
                      ),
                    ),
                    child: const CircularProgressIndicator(
                      color: AppColors.appColor,
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}