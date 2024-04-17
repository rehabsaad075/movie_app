import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/details_model.dart';
import 'package:movie_app/view/componets/widget_custom/circleContainer_custom.dart';
import 'package:movie_app/view_model/cubits/app_cubit/app_cubit.dart';

class GenresSearch extends StatelessWidget {
  const GenresSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return SizedBox(
          height: 40,
          child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CircleContainerCustom(
                  genres: cubit.detailsModel?.genres?[index]??Genres(),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 15,),
              itemCount: cubit.detailsModel?.genres?.length??0
          ),
        );
      },
    );
  }
}
