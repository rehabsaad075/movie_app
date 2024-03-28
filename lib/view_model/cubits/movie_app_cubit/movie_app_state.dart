part of 'movie_app_cubit.dart';

abstract class MovieAppStates {}

class MovieAppInitialState extends MovieAppStates {}

class ChangeIndexButtonNavigationBarState extends MovieAppStates{}

class GetAllMoviesLoadingState extends MovieAppStates {}
class GetAllMoviesSuccessState extends MovieAppStates {}
class GetAllMoviesErrorState extends MovieAppStates {}

class GetTrendingMoviesLoadingState extends MovieAppStates {}
class GetTrendingMoviesSuccessState extends MovieAppStates {}
class GetTrendingMoviesErrorState extends MovieAppStates {}

class GetRatingMoviesLoadingState extends MovieAppStates {}
class GetRatingMoviesSuccessState extends MovieAppStates {}
class GetRatingMoviesErrorState extends MovieAppStates {}

class GetMoreMoviesLoadingState extends MovieAppStates {}
class GetMoreMoviesSuccessState extends MovieAppStates {}
class GetMoreMoviesErrorState extends MovieAppStates {}