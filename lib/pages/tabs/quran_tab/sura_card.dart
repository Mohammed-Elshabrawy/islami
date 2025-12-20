import 'package:flutter/cupertino.dart';

import '../../../model/sura_list/sura_list.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';

class SuraCard extends StatelessWidget {
  const SuraCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                SuraList.quran[index].suraEnglishName,
                style: AppFonts.bold24Black,
              ),
              Text(
                SuraList.quran[index].suraArabicName,
                style: AppFonts.bold24Black,
              ),
              Text(
                "${SuraList.quran[index].suraAyaNumber} Verses",
                style: AppFonts.bold14Black,
              ),
            ],
          ),
          Image.asset(AppAssets.appSuraImage),
        ],
      ),
    );
  }
}
