import 'package:flutter/material.dart';
import 'package:islami/pages/home_screen/home_screen.dart';
import 'package:islami/pages/onboarding/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardingPage(),
    );
  }
}


