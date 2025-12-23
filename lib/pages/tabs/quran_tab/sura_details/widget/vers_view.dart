import 'package:flutter/material.dart';
import 'package:islami/utils/responsive.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_fonts.dart';

class VersView extends StatelessWidget {
  const VersView({super.key, required this.verses});
  final List<String> verses;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: verses.isEmpty
          ? Center(child: CircularProgressIndicator(color: AppColors.goldColor))
          : ListView.separated(
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(context.ratio * 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: AppColors.goldColor),
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  verses[index],
                  style: AppFonts.bold20Gold,
                  textDirection: TextDirection.rtl,
                ),
              ),
              separatorBuilder: (context, index) =>
                  SizedBox(height: context.screenHeightRatio * 10),
              itemCount: verses.length,
            ),
    );
  }
}
