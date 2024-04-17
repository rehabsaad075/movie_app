import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/models/details_model.dart';
import 'package:movie_app/view/screens/favorite_screen.dart';
import 'package:movie_app/view/screens/home_screen.dart';
import 'package:movie_app/view/screens/search_screen/search_screen.dart';
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

  int currentIndex=0;
  void changeIndex(int resultIndex){
    currentIndex=resultIndex;
    emit(ChangeSeriesIndexState());
  }

  AllMoviesModel? similar;
  Future<void> getSimilar() async {
    emit(GetSimilarSearchLoadingState());
    await DioHelper.get(
      endPoint: '${EndPoints.movie}/${allResults?.results?[currentIndex].id}/${EndPoints.similar}',
    ).then((value) {
      similar=AllMoviesModel.fromJson(value.data);
      emit(GetSimilarSearchSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetSimilarSearchErrorState());
      }
    });
  }

  DetailsModel? detailsModel;
  Future<void> getDetails() async {
    emit(GetDetailsSearchLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.movie}/${allResults?.results?[currentIndex].id}',
        parameters: {
          'language':'ar'
        }
    ).then((value) {
      detailsModel=DetailsModel.fromJson(value.data);
      emit(GetDetailsSearchSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetDetailsSearchErrorState());
      }
    });
  }
}
