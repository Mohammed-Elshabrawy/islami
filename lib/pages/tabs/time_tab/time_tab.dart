import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami/pages/tabs/time_tab/widget/azkar_widget.dart';
import 'package:islami/pages/tabs/time_tab/widget/time_widget.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/responsive.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});
  static const List<String> salah = ["Fajr", "Dhuhr", "Asr", "Maghrib", "Isha"];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25 * context.screenWidthRatio),
        child: Column(
          spacing: 20 * context.screenHeightRatio,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Image.asset(AppAssets.appTimeWidget),
                Positioned.fill(
                  top: 4 * context.screenHeightRatio,
                  left: 26 * context.screenWidthRatio,
                  right: 26 * context.screenWidthRatio,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("16 Jul,\n 2024", style: AppFonts.bold16White),
                          Column(
                            spacing: 10 * context.screenHeightRatio,
                            children: [
                              Text(
                                "Pray Time",
                                style: AppFonts.bold20Black.copyWith(
                                  color: AppColors.blackColor.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
                              ),
                              Text(
                                "Tuesday",
                                style: AppFonts.bold20Black.copyWith(
                                  color: AppColors.blackColor.withValues(
                                    alpha: 0.9,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "16 Jul,\n 2024",
                            style: AppFonts.bold16White,
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                      const Spacer(),
                      CarouselSlider(
                        options: CarouselOptions(
                          enlargeFactor: 0.2,
                          viewportFraction: 0.3,
                          height: 128.0 * context.screenHeightRatio,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          aspectRatio: 1.23,
                        ),
                        items: salah.map((salahName) {
                          return TimeWidget(name: salahName);
                        }).toList(),
                      ),
                      const Spacer(),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Text("Next Pray - 02:32", style: AppFonts.bold16Black),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.volume_off_outlined,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              ],
            ),
            Text("Azkar", style: AppFonts.bold16White),
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20 * context.screenWidthRatio,
                mainAxisSpacing: 20 * context.screenHeightRatio,
                childAspectRatio: 185 / 260,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              children: [
                AzkarWidget(
                  image: AppAssets.morningAzkar,
                  title: "Morning Azkar",
                ),
                AzkarWidget(
                  image: AppAssets.sleepingAzkar,
                  title: "Sleeping Azkar",
                ),
                AzkarWidget(
                  image: AppAssets.wakingAzkar,
                  title: "Waking Azkar",
                ),
                AzkarWidget(
                  image: AppAssets.eveningAzkar,
                  title: "Evening Azkar",
                ),
              ],
            ),
            SizedBox(height: 20 * context.screenHeightRatio),
          ],
        ),
      ),
    );
  }
}
