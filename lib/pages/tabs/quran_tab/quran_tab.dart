import 'package:flutter/material.dart';
import 'package:islami/model/sura_list/sura_list.dart';
import 'package:islami/pages/tabs/quran_tab/widget/most_recently.dart';
import 'package:islami/pages/tabs/quran_tab/widget/sura_row.dart';
import 'package:islami/utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/responsive.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0 * context.screenWidthRatio,
      ),
      child: Column(
        spacing: 16 * context.screenHeightRatio,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onChanged: (value) {
              searchBySuraName(value);
            },
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
          SizedBox(
            height: 540 * context.screenHeightRatio,
            child: SingleChildScrollView(
              child: Column(
                spacing: 10 * context.screenHeightRatio,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MostRecently(),
                  Text("Sura List", style: AppFonts.bold16White),
                  SizedBox(
                    child: filterList.isEmpty
                        ? Center(
                            child: Text(
                              "no sura found",
                              style: AppFonts.bold20White,
                            ),
                          )
                        : ListView.separated(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) =>
                                SuraRow(index: filterList[index]),
                            separatorBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 10 * context.screenHeightRatio,
                              ),
                              child: Divider(
                                indent: 40 * context.screenWidthRatio,
                                endIndent: 40 * context.screenWidthRatio,
                              ),
                            ),
                            itemCount: filterList.length,
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void searchBySuraName(String value) {
    filterList.clear();
    List<int> tempList = [];
    for (int i = 0; i < 114; i++) {
      if (SuraList.quran[i].suraArabicName.contains(value) ||
          SuraList.quran[i].suraEnglishName.toLowerCase().contains(
            value.toLowerCase(),
          )) {
        tempList.add(i);
      }
    }
    filterList = tempList;
    setState(() {});
  }
}
