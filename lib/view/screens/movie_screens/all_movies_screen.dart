import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/image_custom.dart';
import 'package:movie_app/view/componets/widget_custom/elvated_button_custom.dart';
import 'package:movie_app/view/screens/movie_screens/movie_details_screen.dart';
import 'package:movie_app/view_model/cubits/movie_cubit/movie_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class AllMoviesScreen extends StatelessWidget {
  const AllMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: MovieCubit.get(context)
        ..getAllMovies(),
      child: BlocBuilder<MovieCubit, MovieStates>(
        builder: (context, state) {
          MovieCubit cubit = MovieCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
             appBar: AppBar(
               title: const Text(
                 'جميع الافلام',
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
                            cubit.changeMovieIndex(index);
                            cubit.getDetailsMovie(movieId: cubit.allMoviesModel);
                            cubit.getSimilarMovies(movieId: cubit.allMoviesModel);
                            navigationPushFunction(
                                context: context,
                                screen: const MovieDetailsScreen()
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
                        replacement: ElevatedButtonCustom(
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
