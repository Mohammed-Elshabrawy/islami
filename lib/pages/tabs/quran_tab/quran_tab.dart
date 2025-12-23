import 'package:flutter/material.dart';
import 'package:islami/model/sura_list/sura_list.dart';
import 'package:islami/pages/tabs/quran_tab/widget/sura_card.dart';
import 'package:islami/pages/tabs/quran_tab/widget/sura_row.dart';
import 'package:islami/utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/responsive.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0 * context.screenWidthRatio),
      child: Column(
        spacing: 16 * context.screenHeightRatio,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            style: AppFonts.bold16White,
            cursorColor: AppColors.goldColor,
            decoration: InputDecoration(
              hintText: "Sura Name",
              hintStyle: AppFonts.bold16White,
              prefixIcon: ImageIcon(
                AssetImage(AppAssets.appIconQuran),
                color: AppColors.goldColor,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.goldColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.goldColor),
              ),
            ),
          ),
          Text("Most Recently", style: AppFonts.normal16White),
          SizedBox(
            height: 150 * context.screenHeightRatio,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => SuraCard(index: index),
              separatorBuilder: (context, index) =>
                  SizedBox(width: 10 * context.screenWidthRatio),
              itemCount: 10,
            ),
          ),
          Text("Sura List", style: AppFonts.bold16White),
          SizedBox(
            child: ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SuraRow(index: index),
              separatorBuilder: (context, index) => Padding(
                padding:  EdgeInsets.symmetric(vertical: 10*context.screenHeightRatio),
                child: Divider(
                  indent: 40 * context.screenWidthRatio,
                  endIndent: 40 * context.screenWidthRatio,
                ),
              ),
              itemCount: SuraList.quran.length,
            ),
          ),
        ],
      ),
    );
  }
}
