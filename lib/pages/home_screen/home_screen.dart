import 'package:flutter/material.dart';
import 'package:islami/pages/tabs/hadith_tab/hadith_tab.dart';
import 'package:islami/pages/tabs/quran_tab/quran_tab.dart';
import 'package:islami/pages/tabs/sebha_tab/sebha_tab.dart';
import '../../components/my_nav_bar_icon.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../tabs/radio_tab/radio_tab.dart';
import '../tabs/time_tab/time_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  static const List<String> images = [
    AppAssets.appBG1,
    AppAssets.appBG2,
    AppAssets.appBG3,
    AppAssets.appBG4,
    AppAssets.appBG5,
  ];
  List<Widget> pages = [
    QuranTab(),
    HadithTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            images[currentIndex],
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                Image.asset(AppAssets.appLogo),
                SizedBox(height: 16),
                pages[currentIndex],
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        backgroundColor: AppColors.goldColor,
        selectedItemColor: AppColors.blackColor,
        unselectedItemColor: AppColors.blackColor,
        items: [
          BottomNavigationBarItem(
            icon: MyNavBarIcon(
              index: 0,
              currentIndex: currentIndex,
              imageIcon: AppAssets.appIconQuran,
            ),
            label: "Quran",
            backgroundColor: AppColors.goldColor,
          ),
          BottomNavigationBarItem(
            icon: MyNavBarIcon(
              index: 1,
              currentIndex: currentIndex,
              imageIcon: AppAssets.appIconHadith,
            ),
            label: "Hadith",
            backgroundColor: AppColors.goldColor,
          ),
          BottomNavigationBarItem(
            icon: MyNavBarIcon(
              index: 2,
              currentIndex: currentIndex,
              imageIcon: AppAssets.appIconSebha,
            ),
            label: "Sebha",
            backgroundColor: AppColors.goldColor,
          ),
          BottomNavigationBarItem(
            icon: MyNavBarIcon(
              index: 3,
              currentIndex: currentIndex,
              imageIcon: AppAssets.appIconRadio,
            ),
            label: "Radio",
            backgroundColor: AppColors.goldColor,
          ),
          BottomNavigationBarItem(
            icon: MyNavBarIcon(
              index: 4,
              currentIndex: currentIndex,
              imageIcon: AppAssets.appIconTime,
            ),
            label: "Time",
            backgroundColor: AppColors.goldColor,
          ),
        ],
      ),
    );
  }
}
