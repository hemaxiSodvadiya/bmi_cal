import 'package:animation_bmi_calculator/screens2/bmi_home_page.dart';
import 'package:animation_bmi_calculator/screens2/result_screen.dart';
import 'package:animation_bmi_calculator/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        'bmi_home_page': (context) => const BmiHomePage(),
      },
    ),
  );
}
