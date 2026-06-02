import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/responsive.dart';

class MyNavBarIcon extends StatelessWidget {
  const MyNavBarIcon({
    super.key,
    required this.index,
    required this.currentIndex,
    this.imageIcon,
    this.icon,
  });
  final IconData? icon;
  final String? imageIcon;
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
        horizontal: 12 * context.screenWidthRatio,
        vertical: 6 * context.screenHeightRatio,
      ),
      child: icon != null
          ? Icon(
              icon,
              size: 28,
              color: currentIndex == index
                  ? AppColors.whiteColor
                  : AppColors.blackColor,
            )
          : imageIcon != null
              ? ImageIcon(
                  AssetImage(imageIcon!),
                  size: 28,
                  color: currentIndex == index
                      ? AppColors.whiteColor
                      : AppColors.blackColor,
                )
              : const SizedBox.shrink(),
    );
  }
}
