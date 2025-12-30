import 'package:flutter/material.dart';
import 'package:islami/utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/responsive.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  final List<String> sebha = [
    "سُبْحَانَ الله",
    "الْحَمْد لله",
    "الله اُكْبُر",
    "لَا اُلْه الَا الله",
  ];
  int sebhaIndex = 0;
  int counter = 0;
  double degree = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25 * context.screenWidthRatio),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            style: AppFonts.bold36White,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20 * context.screenHeightRatio),
          Image.asset(
            AppAssets.appSebhaHead,
            height: 68 * context.screenHeightRatio,
          ),
          InkWell(
            splashColor: AppColors.transparentColor,
            highlightColor: AppColors.transparentColor,
            borderRadius: BorderRadius.circular(100),
            hoverColor: AppColors.transparentColor,
            onTap: countUp,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: degree,
                  child: Image.asset(AppAssets.appSebhaBody),
                ),
                Column(
                  spacing: 32 * context.screenHeightRatio,
                  children: [
                    Text(sebha[sebhaIndex], style: AppFonts.bold36White),
                    Text(counter.toString(), style: AppFonts.bold36White),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void countUp() {
    if (counter == 33) {
      counter = 0;
      sebhaIndex++;
      degree = 0;
      if (sebhaIndex == 4) {
        sebhaIndex = 0;
      }
    } else {
      counter++;
      degree += 12;
    }
    setState(() {});
  }
}
