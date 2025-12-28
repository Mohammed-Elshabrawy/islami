import 'package:flutter/material.dart';
import 'package:islami/utils/app_routes.dart';
import '../../../../model/sura_list/sura_list.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';
import '../../../home_screen/shared_perf_utils.dart';

class SuraRow extends StatelessWidget {
  const SuraRow({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.suraDetails, arguments: index);
        saveLastSuraIndex(index);
        //todo:save sura index
      },
      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(AppAssets.appSuraTile),
              Text('${index + 1}', style: AppFonts.bold20White),
            ],
          ),
          SizedBox(width: 24 * context.screenWidthRatio),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                SuraList.quran[index].suraEnglishName,
                style: AppFonts.bold20White,
              ),
              Text(
                '${SuraList.quran[index].suraAyaNumber} Verses',
                style: AppFonts.bold14White,
              ),
            ],
          ),
          Spacer(),
          Text(
            SuraList.quran[index].suraArabicName,
            style: AppFonts.bold20White,
          ),
        ],
      ),
    );
  }
}
