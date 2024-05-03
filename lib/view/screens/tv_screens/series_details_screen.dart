import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/componets/sections/tv_sections/genres_series_section.dart';
import 'package:movie_app/view/componets/sections/tv_sections/similar_series_section.dart';
import 'package:movie_app/view/componets/widget_custom/fav_and_watch_item.dart';
import 'package:movie_app/view/componets/widget_custom/image_details_custom.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class SeriesDetailsScreen extends StatelessWidget {
  const SeriesDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SeriesCubit, SeriesStates>(
      builder: (context, state) {
        SeriesCubit cubit = SeriesCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Visibility(
              visible: state is GetDetailsSeriesLoadingState,
              replacement: ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: 30, horizontal: 8),
                physics: const BouncingScrollPhysics(),
                children: [
                  ImageDetailsCustom(
                    pathImage: cubit.detailsSeries?.posterPath??'',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    cubit.detailsSeries?.originalTitle ?? '',
                    style: Styles.textStyle30,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    cubit.detailsSeries?.overview ?? '',
                    style: Styles.textStyle20.copyWith(
                        color: AppColors.white70),
                    //textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const GenresSeriesSection(),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Text(
                        'تقييم المسلسل',
                        style: Styles.textStyle18.copyWith(
                            color: AppColors.white70,
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Text(
                        cubit.detailsSeries?.voteAverage?.toStringAsFixed(1).toString()??'',
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
                        cubit.detailsSeries?.releaseDate ?? '',
                        style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.normal
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Visibility(
                        visible: state is AddWatchedSeriesSuccessState,
                        replacement: SizedBox(
                          width: 165,
                          child: FavAndWatchItem(
                              onPressed: (){
                                cubit.addWatchedSeries();
                              },
                              text: 'المشاهدة لاحقا',
                              icon: AppIcons.addIcon
                          ),
                        ),
                        child: const SizedBox(
                          width: 140,
                          child: FavAndWatchItem(
                              text: ' المشاهدات',
                              icon: AppIcons.doneIcon
                          ),
                        ),
                      ),
                      const SizedBox(width: 15,),
                      Visibility(
                        visible: state is AddFavSeriesSuccessState,
                        replacement:SizedBox(
                          width: 185,
                          child: FavAndWatchItem(
                              onPressed: (){
                                cubit.addFavSeries();
                              },
                              text: 'اضافة الى المفضلة',
                              icon: AppIcons.favBorderIcon
                          ),
                        ),
                        child:const SizedBox(
                          width: 155,
                          child: FavAndWatchItem(
                              text: ' المفضل لديك',
                              icon: AppIcons.favIcon
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'قد يعجبك ايضا',
                    style: Styles.textStyle20.copyWith(
                        color: AppColors.whiteColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SimilarSeriesSection ()
                ],
              ),
              child: const Center(
                child: CircularProgressIndicator(
                  color: AppColors.appColor,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}