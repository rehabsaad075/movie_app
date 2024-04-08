import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/searchBar_custom.dart';
import 'package:movie_app/view/componets/widget_custom/search_item_custom.dart';
import 'package:movie_app/view_model/cubits/app_cubit.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
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
                  BlocBuilder<AppCubit, AppState>(
                    builder: (context, state) {
                      AppCubit appCubit=AppCubit.get(context);
                      if(state is SearchSuccessState){
                        return Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 20,),
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                return SearchItemCustom(
                                  onTap: () {},
                                  results:appCubit.allResults?.results?[index]??Results(),
                                );
                              },
                              separatorBuilder: (context,
                                  index) => const SizedBox(height: 15,),
                              itemCount: appCubit.allResults?.results?.length??0
                          ),
                        );
                      }
                      else if(state is SearchErrorState){
                        return const Center(
                            child: Text(
                                'لا توجد نتائج ,حاول مرة اخرى ',
                              style: Styles.textStyle24,
                            ));
                      }
                      else{
                        return const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.appColor,
                            ));
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
