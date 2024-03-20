import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/view/screens/home_page_screen.dart';
import 'package:movie_app/view_model/app_colors.dart';
import 'package:movie_app/view_model/text_styles.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      duration: 2000,
      splash: const Text(
        'movie app',
        style: Styles.textStyle40,
      ),
      nextScreen: const HomePageScreen(),
      splashTransition: SplashTransition.scaleTransition,
      backgroundColor: AppColors.backColorSplash!,
    );
  }
}
