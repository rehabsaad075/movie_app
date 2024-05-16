part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}
class SearchSuccessState extends SearchState {}
class SearchErrorState extends SearchState {}

class ChangeIndexState extends SearchState {}

class GetSimilarSearchLoadingState extends SearchState {}
class GetSimilarSearchSuccessState extends SearchState {}
class GetSimilarSearchErrorState extends SearchState {}

class GetDetailsSearchLoadingState extends SearchState {}
class GetDetailsSearchSuccessState extends SearchState {}
class GetDetailsSearchErrorState extends SearchState {}

class AddFavSearchLoadingState extends SearchState {}
class AddFavSearchSuccessState extends SearchState {}
class AddFavSearchErrorState extends SearchState {}

class AddWatchedSearchLoadingState extends SearchState {}
class AddWatchedSearchSuccessState extends SearchState {}
class AddWatchedSearchErrorState extends SearchState {}

class GetWatchProvidersSearchLoadingState extends SearchState {}
class GetWatchProvidersSearchSuccessState extends SearchState {}
class GetWatchProvidersSearchErrorState extends SearchState {}

class GetDetailsHomePageLoadingState extends SearchState {}
class GetDetailsHomePageSuccessState extends SearchState {}
class GetDetailsHomePageErrorState extends SearchState {}