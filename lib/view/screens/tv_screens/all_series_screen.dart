import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/image_custom.dart';
import 'package:movie_app/view/componets/widget_custom/elvated_button_custom.dart';
import 'package:movie_app/view/screens/tv_screens/series_details_screen.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class AllSeriesScreen extends StatelessWidget {
  const AllSeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: SeriesCubit.get(context)
        ..getAllSeries(),
      child: BlocBuilder<SeriesCubit, SeriesStates>(
        builder: (context, state) {
          SeriesCubit cubit = SeriesCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: const Text(
                  'جميع المسلسلات',
                ),
              ),
              body: Visibility(
                visible: state is GetAllSeriesLoadingState,
                replacement:ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 15),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 3.1/4.5,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15
                      ),
                      itemBuilder: (context, index) {
                        return ImageCustom(
                          results: cubit.allSeries?.results?[index]??Results(),
                          onTap: (){
                            cubit.changeSeriesIndex(index);
                            cubit.getDetailsSeries(seriesModel: cubit.allSeries);
                            cubit.getSimilarSeries(seriesModel: cubit.allSeries);
                            navigationPushFunction(
                                context: context,
                                screen: const SeriesDetailsScreen()
                            );
                          },
                        );
                      },
                      itemCount: cubit.allSeries?.results?.length??0,
                    ),
                    if(cubit.hasMoreResults)
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 24,
                            right: 24,
                            bottom: 20
                        ),
                        child: Visibility(
                          visible: state is GetMoreSeriesLoadingState,
                          replacement: ElevatedButtonCustom(
                            onPressed: () {
                              cubit.getMoreSeries();
                            },
                            child: const Text(
                              'عرض المزيد من المسلسلات',
                              style: Styles.textStyle20,
                            ),
                          ),
                          child:const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.appColor,
                              )
                          ) ,
                        ),
                      )
                  ],
                ) ,
                child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.appColor,
                    )
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}