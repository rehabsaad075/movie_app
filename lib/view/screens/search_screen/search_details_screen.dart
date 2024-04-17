import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/componets/widget_custom/image_details_custom.dart';
import 'package:movie_app/view/componets/widget_custom/search/genres_search.dart';
import 'package:movie_app/view/componets/widget_custom/search/similar_search.dart';
import 'package:movie_app/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

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
