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
part 'movie_app_state.dart';

class MovieAppCubit extends Cubit<MovieAppStates> {
  MovieAppCubit() : super(MovieAppInitialState());
  static MovieAppCubit get(context)=>BlocProvider.of(context);

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

  AllMoviesModel? allMoviesModel;
  Future<void> getAllMovies() async {
    emit(GetAllMoviesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.discover}/${EndPoints.movie}',
      parameters: {
          'language':'ar',
      }
    ).then((value) {
      allMoviesModel=AllMoviesModel.fromJson(value.data);
      emit(GetAllMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        //print(error.response?.data);
        emit(GetAllMoviesErrorState());
      }
    });
  }

  AllMoviesModel? trendingMovies;
  Future<void> getTrendingMovies() async {
    emit(GetTrendingMoviesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.trending}/${EndPoints.movie}/${EndPoints.timeWindow}',
        parameters: {
          'language':'ar',
        }
    ).then((value) {
      trendingMovies=AllMoviesModel.fromJson(value.data);
      emit(GetTrendingMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
       // print(error.response?.data);
        emit(GetTrendingMoviesErrorState());
      }
    });
  }

  AllMoviesModel? ratingMoviesModel;
  Future<void> getRatingMovies() async {
    emit(GetRatingMoviesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.discover}/${EndPoints.movie}',
        parameters: {
          'language':'ar',
          'sort_by':'vote_average.desc'
        }
    ).then((value) {
      ratingMoviesModel=AllMoviesModel.fromJson(value.data);
      emit(GetRatingMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        //print(error.response?.data);
        emit(GetRatingMoviesErrorState());
      }
    });
  }
}
