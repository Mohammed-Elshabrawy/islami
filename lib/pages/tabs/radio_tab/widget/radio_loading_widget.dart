import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/responsive.dart';

class RadioLoadingWidget extends StatefulWidget {
  const RadioLoadingWidget({super.key});

  @override
  State<RadioLoadingWidget> createState() => _RadioLoadingWidgetState();
}

class _RadioLoadingWidgetState extends State<RadioLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: 140 * context.screenHeightRatio,
          decoration: BoxDecoration(
            color: AppColors.goldColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              ShaderMask(
                shaderCallback: (bounds) {
                  return LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                      _controller.value - 0.3,
                      _controller.value,
                      _controller.value + 0.3,
                    ],
                    colors: [
                      Colors.white.withValues(alpha: 0.1),
                      Colors.white.withValues(alpha: 0.5),
                      Colors.white.withValues(alpha: 0.1),
                    ],
                  ).createShader(bounds);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 60),
                    height: 20 * context.screenHeightRatio,
                    decoration: BoxDecoration(
                      color: AppColors.blackColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.blackColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 25),
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          color: AppColors.blackColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 25),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: AppColors.blackColor.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
