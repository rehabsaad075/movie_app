import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/fav_item_custom.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class FavSeriesScreen extends StatelessWidget {
  const FavSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.backColorSplash,
          iconTheme: const IconThemeData(
              color: AppColors.appColor
          ),
          title: Text(
            'المسلسلات المفضلة',
            style: Styles.textStyle22.copyWith(color: AppColors.appColor),
          ),
        ),
        body: BlocBuilder<SeriesCubit, SeriesStates>(
          builder: (context, state) {
            SeriesCubit seriesCubit=SeriesCubit.get(context);
            return Visibility(
              visible: seriesCubit.favTv?.results?.isNotEmpty??true,
              replacement: const Center(
                  child: Text(
                    'لا توجد مسلسلات مفضلة,قم باضافة المسلسلات المفضلة لديك',
                    style: Styles.textStyle20,
                  )),
              child: ListView.builder(
                  padding: const EdgeInsets.all(15),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return  FavItemCustom(
                      icon: AppIcons.favIcon,
                      results: seriesCubit.favTv?.results?[index]??Results(),
                    );
                  },
                  itemCount: seriesCubit.favTv?.results?.length??0
              ),
            );
          },
        ),
      ),
    );
  }
}
