import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/image_custom.dart';
import 'package:movie_app/view/componets/widget_custom/view_all_button.dart';
import 'package:movie_app/view/screens/details_screen.dart';
import 'package:movie_app/view_model/cubits/movie_app_cubit/movie_app_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class AllMoviesScreen extends StatelessWidget {
  const AllMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: MovieAppCubit.get(context)
        ..getAllMovies(),
      child: BlocBuilder<MovieAppCubit, MovieAppStates>(
        builder: (context, state) {
          MovieAppCubit cubit = MovieAppCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.backColorSplash,
                elevation: 0,
                titleSpacing: 0,
                iconTheme: const IconThemeData(
                  color: AppColors.appColor,
                  size: 25,
                ),
                title: Text(
                  'جميع الافلام',
                  style: Styles.textStyle22.copyWith(color: AppColors.appColor),
                ),
              ),
              body: Visibility(
                visible: state is GetAllMoviesLoadingState,
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
                          results: cubit.allMoviesModel?.results?[index]??Results(),
                          onTap: (){
                            navigationPushFunction(
                                context: context,
                                screen: const DetailsScreen()
                            );
                          },
                        );
                      },
                      itemCount: cubit.allMoviesModel?.results?.length??0,
                    ),
                    if(cubit.hasMoreResults)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24,
                          right: 24,
                          bottom: 20
                      ),
                      child: Visibility(
                        visible: state is GetMoreMoviesLoadingState,
                        replacement: ViewAllButton(
                          onPressed: () {
                            cubit.getMoreMovies();
                          },
                          child: const Text(
                            'عرض المزيد من الافلام',
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
