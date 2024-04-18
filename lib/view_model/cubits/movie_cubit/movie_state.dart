part of 'movie_cubit.dart';

abstract class MovieStates {}

class MovieAppInitialState extends MovieStates {}

class ChangeIndexButtonNavigationBarState extends MovieStates{}

class GetAllMoviesLoadingState extends MovieStates {}
class GetAllMoviesSuccessState extends MovieStates {}
class GetAllMoviesErrorState extends MovieStates {}

class GetTrendingMoviesLoadingState extends MovieStates {}
class GetTrendingMoviesSuccessState extends MovieStates {}
class GetTrendingMoviesErrorState extends MovieStates {}

class GetRatingMoviesLoadingState extends MovieStates {}
class GetRatingMoviesSuccessState extends MovieStates {}
class GetRatingMoviesErrorState extends MovieStates {}

class GetMoreMoviesLoadingState extends MovieStates {}
class GetMoreMoviesSuccessState extends MovieStates {}
class GetMoreMoviesErrorState extends MovieStates {}

class GetSimilarMoviesLoadingState extends MovieStates {}
class GetSimilarMoviesSuccessState extends MovieStates {}
class GetSimilarMoviesErrorState extends MovieStates {}

class GetDetailsMovieLoadingState extends MovieStates {}
class GetDetailsMovieSuccessState extends MovieStates {}
class GetDetailsMovieErrorState extends MovieStates {}

class ChangeMovieIndexState extends MovieStates {}

class AddFavMovieLoadingState extends MovieStates {}
class AddFavMovieSuccessState extends MovieStates {}
class AddFavMovieErrorState extends MovieStates {}
