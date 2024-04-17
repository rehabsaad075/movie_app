part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class ChangeIndexButtonNavigationBarState extends AppState {}

class SearchLoadingState extends AppState {}
class SearchSuccessState extends AppState {}
class SearchErrorState extends AppState {}

class ChangeSeriesIndexState extends AppState {}

class GetSimilarSearchLoadingState extends AppState {}
class GetSimilarSearchSuccessState extends AppState {}
class GetSimilarSearchErrorState extends AppState {}

class GetDetailsSearchLoadingState extends AppState {}
class GetDetailsSearchSuccessState extends AppState {}
class GetDetailsSearchErrorState extends AppState {}
