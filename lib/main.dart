import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view_model/cubits/bloc_observer/bloc_observer.dart';
import 'package:movie_app/view_model/cubits/movie_app_cubit/movie_app_cubit.dart';
import 'package:movie_app/view_model/data/diohelper.dart';
import 'package:movie_app/view_model/data/endPoints.dart';

import 'view/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  runApp(const MovieApp());
}



class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieAppCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        theme: ThemeData.dark(),
      ),
    );
  }
}
