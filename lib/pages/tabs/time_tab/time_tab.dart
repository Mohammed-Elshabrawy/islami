import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/pages/tabs/time_tab/cubit/time_cubit.dart';
import 'package:islami/pages/tabs/time_tab/cubit/time_state.dart';
import 'package:islami/pages/tabs/time_tab/widget/azkar_widget.dart';
import 'package:islami/pages/tabs/time_tab/widget/time_loading_widget.dart';
import 'package:islami/pages/tabs/time_tab/widget/time_widget.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_fonts.dart';
import '../../../utils/app_routes.dart';
import '../../../utils/responsive.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  static const List<Map<String, String>> azkarCategories = [
    {
      'image': AppAssets.morningAzkar,
      'title': "Morning Azkar",
      'category': 'أذكار الصباح',
    },
    {
      'image': AppAssets.eveningAzkar,
      'title': "Evening Azkar",
      'category': 'أذكار المساء',
    },
    {
      'image': AppAssets.sleepingAzkar,
      'title': "Sleeping Azkar",
      'category': 'أذكار النوم',
    },
    {
      'image': AppAssets.wakingAzkar,
      'title': "Waking Azkar",
      'category': 'أذكار الاستيقاظ',
    },
    {
      'image': AppAssets.morningAzkar,
      'title': "After Prayer",
      'category': 'أذكار بعد السلام من الصلاة المفروضة',
    },
    {'image': AppAssets.eveningAzkar, 'title': "Tasabih", 'category': 'تسابيح'},
    {
      'image': AppAssets.sleepingAzkar,
      'title': "Quranic Duas",
      'category': 'أدعية قرآنية',
    },
    {
      'image': AppAssets.wakingAzkar,
      'title': "Prophets Duas",
      'category': 'أدعية الأنبياء',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimeCubit()..loadPrayerTimes(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25 * context.screenWidthRatio,
          ),
          child: Column(
            spacing: 20 * context.screenHeightRatio,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BlocBuilder<TimeCubit, TimeState>(
                builder: (context, state) {
                  if (state is TimeLoading) {
                    return const TimeLoadingWidget();
                  } else if (state is TimeError) {
                    return Center(child: Text("Error: ${state.message}"));
                  } else if (state is TimeSuccess) {
                    final timings = state.response.data!.timings!;
                    final hijri = state.response.data!.date!.hijri!;
                    final gregorian = state.response.data!.date!.gregorian!;

                    final prayerList = [
                      {'name': "Fajr", 'time': timings.Fajr},
                      {'name': "Dhuhr", 'time': timings.Dhuhr},
                      {'name': "Asr", 'time': timings.Asr},
                      {'name': "Maghrib", 'time': timings.Maghrib},
                      {'name': "Isha", 'time': timings.Isha},
                    ];

                    return Stack(
                      children: [
                        Image.asset(AppAssets.appTimeWidget),
                        Positioned.fill(
                          top: 4 * context.screenHeightRatio,
                          left: 26 * context.screenWidthRatio,
                          right: 26 * context.screenWidthRatio,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "${gregorian.day} ${gregorian.month?.en?.substring(0, 3)}\n ${gregorian.year}",
                                      style: AppFonts.bold16White,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      spacing: 10 * context.screenHeightRatio,
                                      children: [
                                        Text(
                                          "Pray Time",
                                          style: AppFonts.bold20Black.copyWith(
                                            color: AppColors.blackColor
                                                .withValues(alpha: 0.7),
                                          ),
                                        ),
                                        Text(
                                          gregorian.weekday?.en ?? "",
                                          style: AppFonts.bold20Black.copyWith(
                                            color: AppColors.blackColor
                                                .withValues(alpha: 0.9),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${hijri.day} ${hijri.month?.en?.substring(0, 3)}\n ${hijri.year}",
                                      style: AppFonts.bold16White,
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              CarouselSlider(
                                options: CarouselOptions(
                                  initialPage: state.initialIndex,
                                  enlargeFactor: 0.2,
                                  viewportFraction: 0.3,
                                  height: 128.0 * context.screenHeightRatio,
                                  enlargeCenterPage: true,
                                  enableInfiniteScroll: false,
                                  aspectRatio: 1.23,
                                ),
                                items: prayerList.map((prayer) {
                                  return TimeWidget(
                                    name: prayer['name']!,
                                    time: prayer['time']!,
                                    isHighlighted:
                                        prayer['name'] ==
                                        state.nextPrayerData['name'],
                                  );
                                }).toList(),
                              ),
                              const Spacer(),
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    "Next Pray - ${state.nextPrayerData['remaining']}",
                                    style: AppFonts.bold16Black,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      onPressed: () {
                                        context.read<TimeCubit>().toggleAdhan();
                                      },
                                      icon: Icon(
                                        state.isAdhanPlaying
                                            ? Icons.volume_up_outlined
                                            : Icons.volume_off_outlined,
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
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
              const Text("Azkar", style: AppFonts.bold16White),
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20 * context.screenWidthRatio,
                  mainAxisSpacing: 20 * context.screenHeightRatio,
                  childAspectRatio: 185 / 260,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: azkarCategories.length,
                itemBuilder: (context, index) {
                  final category = azkarCategories[index];
                  return AzkarWidget(
                    image: category['image']!,
                    title: category['title']!,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.azkarDetails,
                        arguments: {
                          'title': category['title']!,
                          'category': category['category']!,
                        },
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20 * context.screenHeightRatio),
            ],
          ),
        ),
      ),
    );
  }
}
