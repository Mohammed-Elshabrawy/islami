import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/pages/tabs/hadith_tab/widget/hadeeth_tab.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/responsive.dart';
import '../../../model/hadeeth.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  final List<Hadeeth> hadeethList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeFactor: 0.25,
        aspectRatio: 1.97,
        height: 618.0 * context.screenHeightRatio,
        enlargeCenterPage: true,
      ),
      items: hadeethList.map((hadeeth) {
        return HadeethTab(hadeeth: hadeeth);
      }).toList(),
    );
  }

  void loadHadithFile() async {
    for (int i = 0; i < 50; i++) {
      String hadithText = await rootBundle.loadString(
        '${AppAssets.appHadeethFile}/h${i + 1}.txt',
      );
      String hadithTitle = hadithText.substring(0, hadithText.indexOf('\n'));
      String hadithContent = hadithText.substring(hadithText.indexOf('\n'));
      hadeethList.add(
        Hadeeth(
          hadeethContent: hadithContent,
          hadeethTitle: hadithTitle,
          index: i,
        ),
      );
    }
    setState(() {});
  }
}
