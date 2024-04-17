import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/componets/widget_custom/image_custom.dart';
import 'package:movie_app/view/screens/search_screen/search_details_screen.dart';
import 'package:movie_app/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:movie_app/view_model/utils/functions/navigation_functions.dart';

class SimilarSearch extends StatelessWidget {
  const SimilarSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        SearchCubit cubit = SearchCubit.get(context);
        return SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * .21,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ImageCustom(
                  results: cubit.similar?.results?[index] ?? Results(),
                  onTap: () {
                    cubit.changeIndex(index);
                    cubit.getDetails();
                    cubit.getSimilar();
                    navigationPushFunction(
                        context: context,
                        screen: const SearchDetailsScreen()
                    );
                  },
                );
              },
              separatorBuilder: (context, index) =>
              const SizedBox(width: 15,),
              itemCount: cubit.similar?.results?.length ?? 0
          ),
        );
      },
    );
  }
}
