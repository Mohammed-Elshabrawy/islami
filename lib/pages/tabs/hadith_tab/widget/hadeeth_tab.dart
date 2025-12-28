import 'package:flutter/material.dart';

import '../../../../model/hadeeth.dart';
import '../../../../utils/app_routes.dart';
import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class HadeethTab extends StatelessWidget {
  const HadeethTab({super.key, required this.hadeeth});
  final Hadeeth hadeeth;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.hadeethDetails,
          arguments: hadeeth,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 25 * context.screenWidthRatio,
          vertical: 40 * context.screenHeightRatio,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.appHadeethBG),
            fit: BoxFit.fitWidth,
          ),
          color: AppColors.goldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          spacing: 10 * context.screenHeightRatio,
          children: [
            Text(
              hadeeth.hadeethTitle,
              style: AppFonts.bold20Black,
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  hadeeth.hadeethContent,
                  style: AppFonts.bold16Black,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
