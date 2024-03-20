import 'package:flutter/material.dart';

import 'view/screens/splash_screen.dart';

void main() {
  runApp(const MovieApp());
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
