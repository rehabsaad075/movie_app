import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/all_movies_model.dart';
import 'package:movie_app/models/details_model.dart';
import 'package:movie_app/view/screens/favorite_screen.dart';
import 'package:movie_app/view/screens/home_screen.dart';
import 'package:movie_app/view/screens/search_screen.dart';
import 'package:movie_app/view/screens/watched_screen.dart';
import 'package:movie_app/view_model/data/diohelper.dart';
import 'package:movie_app/view_model/data/endPoints.dart';
part 'movie_state.dart';

class MovieCubit extends Cubit<MovieStates> {
  MovieCubit() : super(MovieAppInitialState());
  static MovieCubit get(context)=>BlocProvider.of(context);

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
    ).then((value) {
      allMoviesModel=AllMoviesModel.fromJson(value.data);
      emit(GetAllMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetAllMoviesErrorState());
      }
    });
  }

  AllMoviesModel? trendingMovies;
  Future<void> getTrendingMovies() async {
    emit(GetTrendingMoviesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.trending}/${EndPoints.movie}/${EndPoints.timeWindow}',
    ).then((value) {
      trendingMovies=AllMoviesModel.fromJson(value.data);
      emit(GetTrendingMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
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
          'sort_by':'vote_average.desc'
        }
    ).then((value) {
      ratingMoviesModel=AllMoviesModel.fromJson(value.data);
      emit(GetRatingMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetRatingMoviesErrorState());
      }
    });
  }

bool hasMoreResults=true;
  Future<void> getMoreMovies() async {
    emit(GetMoreMoviesLoadingState());
    await DioHelper.get(
        endPoint: '${EndPoints.discover}/${EndPoints.movie}',
        parameters: {
          'page':(allMoviesModel?.page??0)+1
        }
    ).then((value) {
      AllMoviesModel newMoviesModel=AllMoviesModel.fromJson(value.data);
      allMoviesModel?.page=newMoviesModel.page;
      allMoviesModel?.results?.addAll(newMoviesModel.results??[]);
      if(allMoviesModel?.page==allMoviesModel?.totalPages){
        hasMoreResults=false;
      }
      emit(GetMoreMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetMoreMoviesErrorState());
      }
    });
  }

  int currentMovieIndex=0;
  void changeMovieIndex(int movieIndex){
    currentMovieIndex=movieIndex;
    emit(ChangeMovieIndexState());
  }

  AllMoviesModel? similarMovies;
  Future<void> getSimilarMovies() async {
    emit(GetSimilarMoviesLoadingState());
    await DioHelper.get(
      endPoint: '${EndPoints.movie}/${allMoviesModel?.results?[currentMovieIndex].id}/${EndPoints.similar}',
    ).then((value) {
      similarMovies=AllMoviesModel.fromJson(value.data);
      emit(GetSimilarMoviesSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetSimilarMoviesErrorState());
      }
    });
  }

  DetailsModel? detailsModel;
  Future<void> getDetailsMovie() async {
    emit(GetDetailsMovieLoadingState());
    await DioHelper.get(
      endPoint: '${EndPoints.movie}/${allMoviesModel?.results?[currentMovieIndex].id}',
      parameters: {
        'language':'ar'
      }
    ).then((value) {
      detailsModel=DetailsModel.fromJson(value.data);
      emit(GetDetailsMovieSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(GetDetailsMovieErrorState());
      }
    });
  }
}
