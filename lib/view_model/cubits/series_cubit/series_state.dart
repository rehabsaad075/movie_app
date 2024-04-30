part of 'series_cubit.dart';


abstract class SeriesStates {}

class SeriesInitialState extends SeriesStates {}

class GetAllSeriesLoadingState extends SeriesStates {}
class GetAllSeriesSuccessState extends SeriesStates {}
class GetAllSeriesErrorState extends SeriesStates {}

class GetTrendingSeriesLoadingState extends SeriesStates {}
class GetTrendingSeriesSuccessState extends SeriesStates {}
class GetTrendingSeriesErrorState extends SeriesStates {}

class GetRatingSeriesLoadingState extends SeriesStates {}
class GetRatingSeriesSuccessState extends SeriesStates {}
class GetRatingSeriesErrorState extends SeriesStates {}

class GetMoreSeriesLoadingState extends SeriesStates {}
class GetMoreSeriesSuccessState extends SeriesStates {}
class GetMoreSeriesErrorState extends SeriesStates {}

class GetSimilarSeriesLoadingState extends SeriesStates {}
class GetSimilarSeriesSuccessState extends SeriesStates {}
class GetSimilarSeriesErrorState extends SeriesStates {}

class GetDetailsSeriesLoadingState extends SeriesStates {}
class GetDetailsSeriesSuccessState extends SeriesStates {}
class GetDetailsSeriesErrorState extends SeriesStates {}

class ChangeSeriesIndexState extends SeriesStates {}

class AddFavSeriesLoadingState extends SeriesStates {}
class AddFavSeriesSuccessState extends SeriesStates {}
class AddFavSeriesErrorState extends SeriesStates {}

class GetFavSeriesLoadingState extends SeriesStates {}
class GetFavSeriesSuccessState extends SeriesStates {}
class GetFavSeriesErrorState extends SeriesStates {}

class AddWatchedSeriesLoadingState extends SeriesStates {}
class AddWatchedSeriesSuccessState extends SeriesStates {}
class AddWatchedSeriesErrorState extends SeriesStates {}

class GetWatchedSeriesLoadingState extends SeriesStates {}
class GetWatchedSeriesSuccessState extends SeriesStates {}
class GetWatchedSeriesErrorState extends SeriesStates {}

class DeleteFavSeriesSuccessState extends SeriesStates {}
class DeleteFavSeriesErrorState extends SeriesStates {}

class DeleteWatchedSeriesSuccessState extends SeriesStates {}
class DeleteWatchedSeriesErrorState extends SeriesStates {}