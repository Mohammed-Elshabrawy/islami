import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class AzkarWidget extends StatelessWidget {
  const AzkarWidget({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
  });
  final String image, title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 260.0 * context.screenHeightRatio,
        width: 185.0 * context.screenWidthRatio,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppColors.goldColor),
          color: AppColors.blackColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image),
            Text(title, style: AppFonts.bold20White),
          ],
        ),
      ),
    );
  }
}
