part of 'app_cubit.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class ChangeIndexButtonNavigationBarState extends AppState {}

class SearchLoadingState extends AppState {}
class SearchSuccessState extends AppState {}
class SearchErrorState extends AppState {}

