import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/componets/sections/tv_sections/genres_series_section.dart';
import 'package:movie_app/view/componets/sections/tv_sections/similar_series_section.dart';
import 'package:movie_app/view/componets/widget_custom/elvated_button_custom.dart';
import 'package:movie_app/view/componets/widget_custom/fav_and_watch_item.dart';
import 'package:movie_app/view/componets/widget_custom/image_details_custom.dart';
import 'package:movie_app/view/screens/tv_screens/add_rating_tv_screen.dart';
import 'package:movie_app/view/screens/tv_screens/reviews_tv_screen.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/functions/flutterToastFunctions.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      const SizedBox(width: 10,),
                      const Icon(
                        AppIcons.starIcon,
                        color: AppColors.appColor,
                        size: 18,
                      ),
                      const SizedBox(width: 3,),
                      Text(
                        cubit.detailsSeries?.voteAverage?.toStringAsFixed(1).toString()??'',
                        style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                          onPressed: (){
                            navigationPushFunction(
                                context: context,
                                screen: const AddRatingTvScreen()
                            );
                          },
                          child: const Row(
                            children: [
                              Text(
                                'اضافة تقييم',
                                style: Styles.textStyle18,
                              ),
                              SizedBox(width: 5,),
                              Icon(
                                AppIcons.starIcon,
                                color: AppColors.appColor,
                                size: 18,
                              ),
                            ],
                          )
                      ),
                    ],
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
                      const Spacer(),
                      TextButton(
                          onPressed: (){
                            cubit.getReviewsTv();
                            navigationPushFunction(
                                context: context,
                                screen: const ReviewsTvScreen()
                            );
                          },
                          child:  Text(
                            'Reviews',
                            style: Styles.textStyle22.copyWith(color: AppColors.appColor),
                          )
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
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
                  ElevatedButtonCustom(
                      onPressed: () async {
                        cubit.getWatchProvidersTv();
                        Uri url = Uri.parse(cubit.watchProviderModel?.results?.eG?.link??'');
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                        else{
                          showToast(msg: 'هذا المسلسل غير متاح حاليا');
                        }
                      },
                      child: const Text(
                        'للمشاهدة المسلسل ',
                        style: Styles.textStyle20,
                      )
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