import 'package:flutter/material.dart';
import 'package:islami/pages/home_screen/home_screen.dart';
import 'package:islami/pages/tabs/hadith_tab/hadeeth_datails/hadeeth_details.dart';
import 'package:islami/pages/tabs/quran_tab/sura_details/sura_details.dart';
import 'package:islami/pages/tabs/time_tab/azkar_details/azkar_details.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:islami/utils/app_routes.dart';
import 'package:islami/utils/app_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: const IslamiApp(),
    ),
  );
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeScreen,
      theme: AppTheme.darkMode,
      routes: {
        AppRoutes.homeScreen: (context) => const HomeScreen(),
        AppRoutes.suraDetails: (context) => const SuraDetails(),
        AppRoutes.hadeethDetails: (context) => const HadeethDetails(),
        AppRoutes.azkarDetails: (context) => const AzkarDetails(),
      },
    );
  }
}
