import 'package:flutter/material.dart';
import 'package:islami/pages/tabs/quran_tab/widget/sura_card.dart';
import 'package:islami/providers/most_recent_provider.dart';
import 'package:provider/provider.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class MostRecently extends StatefulWidget {
  const MostRecently({super.key});

  @override
  State<MostRecently> createState() => _MostRecentlyState();
}

class _MostRecentlyState extends State<MostRecently> {
  late MostRecentProvider mostRecentProvider;
  @override
  void initState() {
    super.initState();
    //doing something after build
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      mostRecentProvider.getLastSuraIndex();
    });
  }

  void reset() {
    mostRecentProvider.resetMostRecent();
  }

  @override
  Widget build(BuildContext context) {
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return Visibility(
      visible: mostRecentProvider.mostRecentList.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10 * context.screenHeightRatio,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Most Recently", style: AppFonts.normal16White),
              TextButton(
                onPressed: reset,
                child: Text("Reset", style: AppFonts.bold20White),
              ),
            ],
          ),
          SizedBox(
            height: 150 * context.screenHeightRatio,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  SuraCard(index: mostRecentProvider.mostRecentList[index]),
              separatorBuilder: (context, index) =>
                  SizedBox(width: 10 * context.screenWidthRatio),
              itemCount: mostRecentProvider.mostRecentList.length,
            ),
          ),
        ],
      ),
    );
  }
}
