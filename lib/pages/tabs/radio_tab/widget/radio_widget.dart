import 'package:flutter/material.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_fonts.dart';
import '../../../../utils/responsive.dart';

class RadioItemWidget extends StatelessWidget {
  final String name;
  final bool isThisPlaying;
  final VoidCallback onPlayToggle;
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;

  const RadioItemWidget({
    super.key,
    required this.name,
    required this.isThisPlaying,
    required this.onPlayToggle,
    this.onNext,
    this.onPrevious,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140 * context.screenHeightRatio,
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                isThisPlaying ? AppAssets.radioBgOn : AppAssets.radioBg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: AppFonts.bold20Black,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (onPrevious != null)
                    IconButton(
                      onPressed: onPrevious,
                      icon: const Icon(
                        Icons.skip_previous,
                        size: 30,
                        color: AppColors.blackColor,
                      ),
                    ),
                  IconButton(
                    onPressed: onPlayToggle,
                    icon: Icon(
                      isThisPlaying ? Icons.pause : Icons.play_arrow,
                      size: 45,
                      color: AppColors.blackColor,
                    ),
                  ),
                  if (onNext != null)
                    IconButton(
                      onPressed: onNext,
                      icon: const Icon(
                        Icons.skip_next,
                        size: 30,
                        color: AppColors.blackColor,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
