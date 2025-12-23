import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/sura_list/sura_list.dart';
import 'package:islami/pages/tabs/quran_tab/sura_details/widget/sura_view.dart';
import 'package:islami/pages/tabs/quran_tab/sura_details/widget/vers_view.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String sura = '';
  List<String> verses = [];
  bool isSuraView = true;

  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    if (isSuraView && sura.isEmpty) {
      loadSuraFile(index + 1);
    } else if (!isSuraView && verses.isEmpty) {
      loadSuraFile(index + 1);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text(SuraList.quran[index].suraEnglishName),
        toolbarHeight: 80 * context.screenHeightRatio,
        actions: [
          Text("Aya", style: AppFonts.bold14Gold),
          SizedBox(
            height: 10,
            child: Switch(
              activeThumbColor: AppColors.goldColor,
              inactiveThumbColor: AppColors.blackColor,
              value: isSuraView,
              onChanged: (value) {
                isSuraView = value;
                setState(() {});
              },
            ),
          ),
          Text("Sura", style: AppFonts.bold14Gold),
          SizedBox(width: 20 * context.screenWidthRatio),
        ],
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
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8 * context.screenHeightRatio,
              horizontal: 30 * context.screenWidthRatio,
            ),
            child: Column(
              spacing: 40 * context.screenHeightRatio,
              children: [
                Text(
                  SuraList.quran[index].suraArabicName,
                  style: AppFonts.bold24Gold,
                ),
                isSuraView ? SuraView(sura: sura) : VersView(verses: verses),
                SizedBox(height: 40 * context.screenHeightRatio),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> loadSuraFile(int index) async {
    String suraText = await rootBundle.loadString(
      '${AppAssets.appSuraFile}/$index.txt',
    );
    List<String> suraList = suraText.split('\n');
    for (int i = 0; i < suraList.length; i++) {
      suraList[i] += '[${i + 1}]';
    }
    isSuraView ? sura = suraList.join() : verses = suraList;
    setState(() {});
  }
}
