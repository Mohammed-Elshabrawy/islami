import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:islami/pages/home_screen/home_screen.dart';
import 'package:islami/utils/app_colors.dart';

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
    const pageDecoration = PageDecoration(
      titlePadding: EdgeInsets.only(top: 20),
      titleTextStyle: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: AppColors.goldColor,
      ),
      bodyTextStyle: TextStyle(
        fontSize: 20.0,
        color: AppColors.goldColor,
        fontWeight: FontWeight.bold,
      ),
      bodyPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      imageAlignment: Alignment.bottomCenter,
      imageFlex: 4,
      pageColor: AppColors.blackColor,
      imagePadding: EdgeInsets.only(left: 16, right: 16, top: 40),
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
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage("assets/images/logo/islami_logo.png"),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Welcome To Islami App",
          body: "",
          image: _buildImage('assets/images/onboarding/onboarding1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Welcome To Islami",
          body: "We Are Very Excited To Have You In Our Community",
          image: _buildImage('assets/images/onboarding/onboarding2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Reading the Quran",
          body: "Read, and your Lord is the Most Generous",
          image: _buildImage('assets/images/onboarding/onboarding3.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Bearish",
          body: "Praise the name of your Lord, the Most High",
          image: _buildImage("assets/images/onboarding/onboarding4.png"),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Holy Quran Radio",
          body:
              "You can listen to the Holy Quran Radio through the application for free and easily",
          image: _buildImage('assets/images/onboarding/onboarding5.png'),
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
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
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
