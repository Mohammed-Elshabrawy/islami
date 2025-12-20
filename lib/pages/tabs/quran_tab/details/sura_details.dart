import 'package:flutter/material.dart';
import 'package:islami/model/sura_list/sura_list.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';

import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class SuraDetails extends StatelessWidget {
  const SuraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeightRatio = screenHeight / Responsive.uiHeight;
    double screenWidthRatio = screenWidth / Responsive.uiWidth;
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(SuraList.quran[index].suraEnglishName),
        toolbarHeight: 80 * screenHeightRatio,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            AppAssets.appSuraDetails,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              SizedBox(height: 8 * screenHeightRatio),
              Text(
                SuraList.quran[index].suraArabicName,
                style: AppFonts.bold24Gold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
