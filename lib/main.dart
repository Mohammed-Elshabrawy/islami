import 'package:flutter/material.dart';
import 'package:islami/pages/home_screen/home_screen.dart';
import 'package:islami/pages/onboarding/onboarding_screen.dart';
import 'package:islami/pages/tabs/quran_tab/details/sura_details.dart';
import 'package:islami/utils/App_routes.dart';
import 'package:islami/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      routes:  {
        AppRoutes.homeScreen: (context) => const HomeScreen(),
        AppRoutes.onBoarding: (context) => const OnBoardingPage(),
        AppRoutes.suraDetails: (context) => const SuraDetails(),
      },
      darkTheme: AppTheme.darkMode,
      themeMode: ThemeMode.dark,
    );
  }
}


