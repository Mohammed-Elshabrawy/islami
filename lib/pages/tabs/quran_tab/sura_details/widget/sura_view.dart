import 'package:flutter/material.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_fonts.dart';

class SuraView extends StatelessWidget{
  const SuraView({super.key,required this.sura});
  final String sura;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: sura.isEmpty
          ? Center(
        child: CircularProgressIndicator(
          color: AppColors.goldColor,
        ),
      )
          : SingleChildScrollView(
        child: Text(
          textAlign: TextAlign.center,
          sura,
          style: AppFonts.bold20Gold,
          textDirection: TextDirection.rtl,
        ),
      ),
    );
  }

}