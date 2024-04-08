import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/view/screens/favorite_screen.dart';
import 'package:movie_app/view/screens/home_screen.dart';
import 'package:movie_app/view/screens/search_screen.dart';
import 'package:movie_app/view/screens/watched_screen.dart';
import 'package:movie_app/view_model/data/diohelper.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context)=>BlocProvider.of(context);

  List<Widget>screens=const[
    SearchScreen(),
    WatchedScreen(),
    FavoriteScreen(),
    HomeScreen(),
  ];

  int buttonNavigationBarIndex=3;
  void changeIndexButtonNavigationBar(int value){
    buttonNavigationBarIndex=value;
    emit(ChangeIndexButtonNavigationBarState());
  }

  AllMoviesModel ?allResults;
  Future<void>searchOfResults({required String movieName})async {
    emit(SearchLoadingState());
    await DioHelper.get(
        endPoint: EndPoints.search,
      parameters: {
          'query':movieName
      }
    ).then((value) {
      allResults=AllMoviesModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(SearchErrorState());
      }
    });
}
}
