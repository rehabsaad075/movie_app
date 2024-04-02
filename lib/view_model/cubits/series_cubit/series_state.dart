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
