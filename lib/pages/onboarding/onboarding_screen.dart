import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/pages/home_screen/home_screen.dart';
import 'package:islami/utils/app_colors.dart';

import '../../utils/app_assets.dart';
import '../../utils/responsive.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  Widget _buildImage(String assetName) {
    return Image.asset(assetName);
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenRatio = screenHeight / screenWidth;

    double screenHeightRatio = screenHeight / Responsive.uiHeight;
    double screenWidthRatio = screenWidth / Responsive.uiWidth;
    double ratio = screenRatio / Responsive.uiRatio;

    final pageDecoration = PageDecoration(
      titlePadding: EdgeInsets.only(top: 20 * (screenHeightRatio)),
      titleTextStyle: const TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: AppColors.goldColor,
      ),
      bodyTextStyle: const TextStyle(
        fontSize: 20.0,
        color: AppColors.goldColor,
        fontWeight: FontWeight.bold,
      ),
      bodyPadding: EdgeInsets.fromLTRB(
        16.0 * screenWidthRatio,
        16.0 * screenHeightRatio,
        16.0 * screenWidthRatio,
        0.0,
      ),
      imageAlignment: Alignment.bottomCenter,
      imageFlex: 4,
      pageColor: AppColors.blackColor,
      imagePadding: EdgeInsets.only(
        left: 16 * screenWidthRatio,
        right: 16 * screenWidthRatio,
        top: 40 * screenHeightRatio,
      ),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.blackColor,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      globalHeader: Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: 16 * screenHeightRatio,
              right: 16 * screenWidthRatio,
            ),
            child: _buildImage(AppAssets.appLogo),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome To Islami App",
          body: "",
          image: _buildImage(AppAssets.appOnboarding1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage(AppAssets.appOnboarding2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage(AppAssets.appOnboarding3),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage(AppAssets.appOnboarding4),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage(AppAssets.appOnboarding5),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      back: const Text("Back", style: TextStyle(color: AppColors.goldColor)),
      next: const Text("Next", style: TextStyle(color: AppColors.goldColor)),
      done: const Text(
        'Finish',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: AppColors.goldColor,
        ),
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: EdgeInsets.all(16 * ratio),
      controlsPadding: EdgeInsets.fromLTRB(
        8.0 * screenWidthRatio,
        4.0 * screenHeightRatio,
        8.0 * screenWidthRatio,
        4.0 * screenHeightRatio,
      ),
      dotsDecorator:  DotsDecorator(
        size: Size(10.0*screenWidthRatio, 10.0*screenHeightRatio),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0*screenWidthRatio, 10.0*screenHeightRatio),
        activeColor: AppColors.goldColor,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
