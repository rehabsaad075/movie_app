import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/view_model/cubits/app_cubit/app_cubit.dart';
import 'package:movie_app/view_model/cubits/bloc_observer/bloc_observer.dart';
import 'package:movie_app/view_model/cubits/search_cubit/search_cubit.dart';
import 'package:movie_app/view_model/cubits/series_cubit/series_cubit.dart';
import 'package:movie_app/view_model/data/diohelper.dart';
import 'package:movie_app/view_model/utils/colors/app_colors.dart';
import 'package:movie_app/view_model/utils/styles/text_styles.dart';
import 'view/screens/splash_screen.dart';
import 'view_model/cubits/movie_cubit/movie_cubit.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieCubit(),
        ),
        BlocProvider(
          create: (context) => SeriesCubit(),
        ),
        BlocProvider(
            create:(context) =>AppCubit()
        ),
        BlocProvider(
            create:(context) =>SearchCubit()
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
        darkTheme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.backColorSplash,
            titleSpacing: 0,
            iconTheme: const IconThemeData(
              color: AppColors.appColor,
              size: 25,
            ),
            titleTextStyle: Styles.textStyle22.copyWith(color: AppColors.appColor),
          ),
          scaffoldBackgroundColor: AppColors.backColorSplash,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.backColorSplash,

          ),
        ),
        themeMode: ThemeMode.dark,
      ),
    );
  }
}
