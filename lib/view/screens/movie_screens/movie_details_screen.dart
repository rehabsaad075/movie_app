import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/componets/sections/movie_sections/buy_movie_list.dart';
import 'package:movie_app/view/componets/sections/movie_sections/flatrate_movie_list.dart';
import 'package:movie_app/view/componets/sections/movie_sections/genres_movies_section.dart';
import 'package:movie_app/view/componets/sections/movie_sections/rent_movie_list.dart';
import 'package:movie_app/view/componets/sections/movie_sections/similer_movie_section.dart';
import 'package:movie_app/view/componets/widget_custom/elvated_button_custom.dart';
import 'package:movie_app/view/componets/widget_custom/fav_and_watch_item.dart';
import 'package:movie_app/view/componets/widget_custom/image_details_custom.dart';
import 'package:movie_app/view/screens/movie_screens/add_rating_movie_screen.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/functions/flutterToastFunctions.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
  value: MovieCubit.get(context)..getWatchProvidersMovie(),
  child: BlocBuilder<MovieCubit, MovieStates>(
      builder: (context, state) {
        MovieCubit cubit = MovieCubit.get(context);
        if (state is GetDetailsMovieLoadingState ){
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.appColor,
            ),
          );
        }
        else{
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              body:ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: 30, horizontal: 8),
                physics: const BouncingScrollPhysics(),
                children: [
                  ImageDetailsCustom(
                    pathImage: cubit.detailsMovie?.posterPath??'',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    cubit.detailsMovie?.originalTitle ?? '',
                    style: Styles.textStyle30,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    cubit.detailsMovie?.overview ?? '',
                    style: Styles.textStyle20.copyWith(
                        color: AppColors.white70),
                    //textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const GenresMoviesSection(),
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
                      const SizedBox(width: 10,),
                      const Icon(
                        AppIcons.starIcon,
                        color: AppColors.appColor,
                        size: 18,
                      ),
                      const SizedBox(width: 3,),
                      Text(
                        cubit.detailsMovie?.voteAverage?.toStringAsFixed(1).toString()??'',
                        style: Styles.textStyle18.copyWith(
                            fontWeight: FontWeight.normal
                        ),
                      ),
                      const SizedBox(width: 100,),
                      TextButton(
                          onPressed: (){
                            navigationPushFunction(
                                context: context,
                                screen: const AddRatingMovieScreen()
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
                        cubit.detailsMovie?.releaseDate ?? '',
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
                        visible: state is AddWatchedMovieSuccessState,
                        replacement: SizedBox(
                          width: 165,
                          child: FavAndWatchItem(
                              onPressed: (){
                                cubit.addWatchedMovie();
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
                        visible: state is AddFavMovieSuccessState,
                        replacement:SizedBox(
                          width: 185,
                          child: FavAndWatchItem(
                              onPressed: (){
                                cubit.addFavMovie();
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
                  if((cubit.watchProviderModel?.results?.eG?.flatrate??[]).isNotEmpty)
                    ...[
                      Text(
                        'بث',
                        style: Styles.textStyle22.copyWith(color: AppColors.appColor),
                      ),
                      const FlatrateMovieList(),
                    ],
                  if((cubit.watchProviderModel?.results?.eG?.rent??[]).isNotEmpty)
                    ...[
                      Text(
                        'ايجار',
                        style: Styles.textStyle22.copyWith(color: AppColors.appColor),
                      ),
                      const RentMovieList(),
                    ],
                  if((cubit.watchProviderModel?.results?.eG?.buy??[]).isNotEmpty)
                    ...[
                      Text(
                        'شراء',
                        style: Styles.textStyle22.copyWith(color: AppColors.appColor),
                      ),
                      const BuyMovieList(),
                      const SizedBox(height: 30,),
                    ],
                  ElevatedButtonCustom(
                      onPressed: () async {
                        Uri url = Uri.parse(cubit.watchProviderModel?.results?.eG?.link??'');
                        if (await canLaunchUrl(url)) {
                        await launchUrl(url);
                        }
                        else{
                          showToast(msg: 'هذا الفيلم غير متاح حاليا');
                        }
                      },
                      child: const Text(
                        'للمشاهدة الفيلم ',
                        style: Styles.textStyle20,
                      )
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'افلام قد تعجبك',
                    style: Styles.textStyle20.copyWith(
                        color: AppColors.whiteColor),
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
      },
    ),
);
  }
}
