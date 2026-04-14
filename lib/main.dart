import 'package:flutter/material.dart';
import 'package:islami/pages/home_screen/home_screen.dart';
import 'package:islami/pages/onboarding/onboarding_screen.dart';
import 'package:islami/pages/tabs/hadith_tab/hadeeth_datails/hadeeth_details.dart';
import 'package:islami/pages/tabs/quran_tab/sura_details/sura_details.dart';
import 'package:islami/pages/tabs/time_tab/azkar_details/azkar_details.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool onboardingCompleted =
      prefs.getBool('onboarding_completed') ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: IslamiApp(onboardingCompleted: onboardingCompleted),
    ),
  );
}

class IslamiApp extends StatelessWidget {
  final bool onboardingCompleted;
  const IslamiApp({super.key, required this.onboardingCompleted});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: onboardingCompleted
          ? AppRoutes.homeScreen
          : AppRoutes.onBoarding,
      theme: AppTheme.darkMode,
      routes: {
        AppRoutes.homeScreen: (context) => const HomeScreen(),
        AppRoutes.onBoarding: (context) => const OnBoardingPage(),
        AppRoutes.suraDetails: (context) => const SuraDetails(),
        AppRoutes.hadeethDetails: (context) => const HadeethDetails(),
        AppRoutes.azkarDetails: (context) => const AzkarDetails(),
      },
    );
  }
}
