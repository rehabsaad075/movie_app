import 'package:flutter/material.dart';
import 'package:movie_app/view_model/data/diohelper.dart';
import 'package:movie_app/view_model/data/endPoints.dart';

import 'view/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  runApp(const MovieApp());
  getAllMovies();
}
Future<void>getAllMovies()async {
  await DioHelper.get(
      endPoint: '${EndPoints.discover}/${EndPoints.movie}'
  ).then((value) {
    print(value);
  });
}


class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData.dark(),
    );
  }
}
