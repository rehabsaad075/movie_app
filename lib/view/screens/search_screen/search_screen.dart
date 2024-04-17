import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/search/searchBar_custom.dart';
import 'package:movie_app/view/componets/widget_custom/search/search_item_custom.dart';
import 'package:movie_app/view/screens/search_screen/search_details_screen.dart';
import 'package:movie_app/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SearchBarCustom(),
                  const SizedBox(height: 15,),
                  const Text(
                    'النتائج',
                    style: Styles.textStyle24,
                  ),
                  BlocBuilder<SearchCubit, SearchState>(
                    builder: (context, state) {
                      SearchCubit searchCubit=SearchCubit.get(context);
                      if(state is SearchSuccessState){
                        return Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 20,),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return SearchItemCustom(
                                  onTap: () {
                                    searchCubit.changeIndex(index);
                                    searchCubit.getSimilar();
                                    searchCubit.getDetails();
                                    navigationPushFunction(
                                        context: context,
                                        screen: const SearchDetailsScreen()
                                    );
                                  },
                                  results:searchCubit.allResults?.results?[index]??Results(),
                                );
                              },
                              separatorBuilder: (context,
                                  index) => const SizedBox(height: 15,),
                              itemCount: searchCubit.allResults?.results?.length??0
                          ),
                        );
                      }
                      else if(state is SearchErrorState){
                        return Expanded(
                          child: SizedBox(
                            height:  MediaQuery
                                .of(context)
                                .size
                                .height * .55,
                            child: Center(
                                child: Text(
                                    'لا توجد نتائج ,حاول مرة اخرى ',
                                  style: Styles.textStyle24.copyWith(color: AppColors.white70),
                                )),
                          ),
                        );
                      }
                      else if (state is SearchLoadingState){
                        return Expanded(
                          child: SizedBox(
                            height:  MediaQuery
                                .of(context)
                                .size
                                .height * .55,
                            child: const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.appColor,
                                )),
                          ),
                        );
                      }
                      else{
                        return  Expanded(
                          child: SizedBox(
                            height:  MediaQuery
                                .of(context)
                                .size
                                .height * .55,
                            child: Center(
                              child: Text(
                                'قم بالبحث لظهور النتائج',
                                style: Styles.textStyle22.copyWith(color: AppColors.gr),
                              ),
                            ),
                          ),
                        ) ;
                      }
                    },
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
