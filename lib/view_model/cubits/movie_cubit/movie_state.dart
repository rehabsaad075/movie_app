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

class GetFavMovieLoadingState extends MovieStates {}
class GetFavMovieSuccessState extends MovieStates {}
class GetFavMovieErrorState extends MovieStates {}

class AddWatchedMovieLoadingState extends MovieStates {}
class AddWatchedMovieSuccessState extends MovieStates {}
class AddWatchedMovieErrorState extends MovieStates {}

class GetWatchedMovieLoadingState extends MovieStates {}
class GetWatchedMovieSuccessState extends MovieStates {}
class GetWatchedMovieErrorState extends MovieStates {}


class DeleteFavMovieSuccessState extends MovieStates {}
class DeleteFavMovieErrorState extends MovieStates {}

class DeleteWatchedMovieSuccessState extends MovieStates {}
class DeleteWatchedMovieErrorState extends MovieStates {}

class ChangeFavMovieState extends MovieStates {}

class GetWatchProvidersMovieLoadingState extends MovieStates {}
class GetWatchProvidersMovieSuccessState extends MovieStates {}
class GetWatchProvidersMovieErrorState extends MovieStates {}

class AddRatingMovieLoadingState extends MovieStates {}
class AddRatingMovieSuccessState extends MovieStates {}
class AddRatingMovieErrorState extends MovieStates {}

class GetReviewsMovieLoadingState extends MovieStates {}
class GetReviewsMovieSuccessState extends MovieStates {}
class GetReviewsMovieErrorState extends MovieStates {}

class GetDetailsMovieHomePageLoadingState extends MovieStates {}
class GetDetailsMovieHomePageSuccessState extends MovieStates {}
class GetDetailsMovieHomePageErrorState extends MovieStates {}