import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class TimeWidget extends StatelessWidget {
  final String name, time;
  final bool isHighlighted;
  const TimeWidget({
    super.key,
    required this.name,
    required this.time,
    this.isHighlighted = false,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Clean the time string (removes timezone if present)
    final String cleanTime = time.split(' ')[0];

    // 2. Parse the 24-hour time
    final DateTime parsedTime = DateFormat("HH:mm").parse(cleanTime);

    // 3. Format into 12-hour components
    final String formattedTime = DateFormat('hh:mm').format(parsedTime);
    final String amPm = DateFormat('a').format(parsedTime);

    return Container(
      height: 128.0 * context.screenHeightRatio,
      width: 104.0 * context.screenWidthRatio,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        // Add a glow/border when highlighted
        border: isHighlighted
            ? Border.all(color: AppColors.whiteColor, width: 2)
            : null,
        boxShadow: isHighlighted
            ? [
                BoxShadow(
                  color: AppColors.goldColor.withValues(alpha: 0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ]
            : null,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isHighlighted
              ? [const Color(0xffB19768), const Color(0xffB19768).withValues(alpha: 0.8)] // Prominent Gold
              : [AppColors.blackColor.withValues(alpha: 0.8), AppColors.blackColor],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            style: isHighlighted ? AppFonts.bold16Black : AppFonts.bold16White,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              formattedTime,
              style: isHighlighted ? AppFonts.bold24Black : AppFonts.bold24White,
            ),
          ),
          Text(
            amPm,
            style: isHighlighted ? AppFonts.bold16Black : AppFonts.bold16White,
          ),
        ],
      ),
    );
  }
}
