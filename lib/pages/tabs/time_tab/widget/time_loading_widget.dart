import 'package:flutter/material.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/responsive.dart';

class TimeLoadingWidget extends StatefulWidget {
  const TimeLoadingWidget({super.key});

  @override
  State<TimeLoadingWidget> createState() => _TimeLoadingWidgetState();
}

class _TimeLoadingWidgetState extends State<TimeLoadingWidget>
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
        return Stack(
          children: [
            Container(
              height: 300 * context.screenHeightRatio,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.blackColor.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(40),
              ),
              child: ShaderMask(
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
                      Colors.white.withValues(alpha: 0.05),
                      Colors.white.withValues(alpha: 0.2),
                      Colors.white.withValues(alpha: 0.05),
                    ],
                  ).createShader(bounds);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 20,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildSkeletonBox(40, 60),
                      _buildSkeletonBox(40, 100),
                      _buildSkeletonBox(40, 60),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: _buildSkeletonBox(128, 104, radius: 20),
                      ),
                    ),
                  ),
                  const Spacer(),
                  _buildSkeletonBox(20, 150),
                  const Spacer(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSkeletonBox(double height, double width, {double radius = 10}) {
    return Container(
      height: height * context.screenHeightRatio,
      width: width * context.screenWidthRatio,
      decoration: BoxDecoration(
        color: AppColors.whiteColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
