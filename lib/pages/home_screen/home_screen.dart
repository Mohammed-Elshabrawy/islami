import 'package:flutter/material.dart';
import '../../components/my_nav_bar_icon.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';

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
    const Placeholder(color: AppColors.blackColor),
    const Placeholder(color: AppColors.greyColor),
    const Placeholder(color: AppColors.goldColor),
    const Placeholder(color: AppColors.brownColor),
    const Placeholder(color: AppColors.ofWhiteColor),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              images[currentIndex],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 16),
                Image.asset(AppAssets.appLogo),
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
