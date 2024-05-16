import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/componets/widget_custom/elvated_button_custom.dart';
import 'package:movie_app/view/componets/widget_custom/fav_and_watch_item.dart';
import 'package:movie_app/view/componets/widget_custom/image_details_custom.dart';
import 'package:movie_app/view/componets/widget_custom/search/genres_search.dart';
import 'package:movie_app/view/componets/widget_custom/search/similar_search.dart';
import 'package:movie_app/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/functions/flutterToastFunctions.dart';
import 'package:movie_app/view_model/utils/icons/app_icons.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchDetailsScreen extends StatelessWidget {
  const SearchDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        SearchCubit cubit = SearchCubit.get(context);
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Visibility(
              visible: state is SearchLoadingState,
              replacement: ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: 30, horizontal: 8),
                physics: const BouncingScrollPhysics(),
                children: [
                  ImageDetailsCustom(
                    pathImage: cubit.detailsModel?.posterPath??'',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    cubit.detailsModel?.originalTitle ?? '',
                    style: Styles.textStyle30,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    cubit.detailsModel?.overview ?? '',
                    style: Styles.textStyle20.copyWith(
                        color: AppColors.white70),
                    //textDirection: TextDirection.rtl,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const GenresSearch(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () async {
                            cubit.getDetailsHomePage();
                            Uri url = Uri.parse(cubit.detailsHomePage?.homepage??'');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                            else{
                              showToast(msg: 'الاعلان غير متوفر حاليا');
                            }
                          },
                          child: Text(
                            'لمشاهدة الاعلان ',
                            style: Styles.textStyle18.copyWith(
                                color: AppColors.whiteColor,
                                decoration: TextDecoration.underline
                            ),
                          )
                      ),
                      const Icon(
                        AppIcons.watchedIcon,
                        color: AppColors.whiteColor,
                      )
                    ],
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
                        cubit.detailsModel?.voteAverage?.toStringAsFixed(1).toString()??'',
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
                        cubit.detailsModel?.releaseDate ?? '',
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
                        visible: state is AddWatchedSearchSuccessState,
                        replacement: SizedBox(
                          width: 165,
                          child: FavAndWatchItem(
                              onPressed: (){
                                cubit.addWatchedSearch();
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
                        visible: state is AddFavSearchSuccessState,
                        replacement:SizedBox(
                          width: 185,
                          child: FavAndWatchItem(
                              onPressed: (){
                                cubit.addFavSearch();
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
                        cubit.getWatchProvidersMovie();
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
                    'قد يعجبك ايضا',
                    style: Styles.textStyle20.copyWith(
                        color: AppColors.whiteColor),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const SimilarSearch ()
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
