import 'package:flutter/material.dart';
import 'package:islami/model/hadeeth.dart';
import 'package:islami/utils/app_assets.dart';
import 'package:islami/utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class HadeethDetails extends StatefulWidget {
  const HadeethDetails({super.key});

  @override
  State<HadeethDetails> createState() => _HadeethDetailsState();
}

class _HadeethDetailsState extends State<HadeethDetails> {
  late Hadeeth hadeeth;

  @override
  Widget build(BuildContext context) {
    hadeeth = ModalRoute.of(context)!.settings.arguments as Hadeeth;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        title: Text("Hadeeth ${hadeeth.index + 1}"),
        toolbarHeight: 80 * context.screenHeightRatio,
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
                Text(hadeeth.hadeethTitle, style: AppFonts.bold24Gold),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      textAlign: TextAlign.center,
                      hadeeth.hadeethContent,
                      style: AppFonts.bold20Gold,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ),
                SizedBox(height: 40 * context.screenHeightRatio),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
