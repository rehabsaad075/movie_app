import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view/screens/favotite_screens/favorite_screen.dart';
import 'package:movie_app/view/screens/home_screen.dart';
import 'package:movie_app/view/screens/search_screen/search_screen.dart';
import 'package:movie_app/view/screens/watched_screens/watched_screen.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context)=>BlocProvider.of(context);

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



}
