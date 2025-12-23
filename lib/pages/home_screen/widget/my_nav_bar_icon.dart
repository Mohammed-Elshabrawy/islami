import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';

class MyNavBarIcon extends StatelessWidget {
  const MyNavBarIcon({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.imageIcon,
  });
  final String imageIcon;
  final int index;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: currentIndex == index
            ? AppColors.greyColor
            : AppColors.transparentColor,
        borderRadius: BorderRadius.circular(66),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20 * context.screenWidthRatio,
        vertical: 5 * context.screenHeightRatio,
      ),
      child: ImageIcon(
        AssetImage(imageIcon),
        color: currentIndex == index
            ? AppColors.whiteColor
            : AppColors.blackColor,
      ),
    );
  }
}
