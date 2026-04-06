
import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class TimeWidget extends StatelessWidget {
  final String name;
  const TimeWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 128.0 * context.screenHeightRatio,
      width: 104.0 * context.screenWidthRatio,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.blackColor, Color(0xffB19768)],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name, style: AppFonts.bold16White),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text("04:38", style: AppFonts.bold24White),
          ),
          Text("AM", style: AppFonts.bold16White),
        ],
      ),
    );
  }
}
