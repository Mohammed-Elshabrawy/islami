import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class AzkarWidget extends StatelessWidget{
  const AzkarWidget({super.key, required this.image, required this.title});
  final String image,title;


  @override
  Widget build(BuildContext context) {
    return Container(
        height: 260.0 * context.screenHeightRatio,
        width: 185.0 * context.screenWidthRatio,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.goldColor,
          ),
          color: AppColors.blackColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image,),
            Text(title, style: AppFonts.bold20White),
          ],
        )
    );
  }

}
