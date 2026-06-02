import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import 'cubit/qibla_cubit.dart';
import 'cubit/qibla_state.dart';

class QiblaTab extends StatelessWidget {
  const QiblaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QiblaCubit()..checkSensorSupport(),
      child: const QiblaTabView(),
    );
  }
}

class QiblaTabView extends StatelessWidget {
  const QiblaTabView({super.key});

  void _showCalibrationDialog(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
          backgroundColor: AppColors.blackColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: AppColors.goldColor, width: 2),
          ),
          title: const Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 28),
              SizedBox(width: 10),
              Text(
                "Calibration Needed",
                style: TextStyle(color: AppColors.goldColor),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.qiblaCalibrationGif, height: 150),
              const SizedBox(height: 20),
              const Text(
                "Your compass sensor is unreliable. Please move your phone in a Figure-8 motion to calibrate it for an accurate Qibla direction.",
                style: TextStyle(color: AppColors.whiteColor),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "OK",
                style: TextStyle(color: AppColors.goldColor, fontSize: 18),
              ),
            ),
          ],
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<QiblaCubit, QiblaState>(
      listener: (context, state) {
        if (state is QiblaSuccess && state.isUnreliable && !state.dialogShown) {
          context.read<QiblaCubit>().setDialogShown(true);
          _showCalibrationDialog(context);
        }
      },
      child: BlocBuilder<QiblaCubit, QiblaState>(
        builder: (context, state) {
          if (state is QiblaLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.goldColor),
            );
          }
          if (state is QiblaUnsupported) {
            return const Center(child: Text("Device doesn't support sensors"));
          }
          if (state is QiblaError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          if (state is QiblaSuccess) {
            final qiblahDirection = state.qiblahDirection;

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Qibla Direction",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Compass border
                      Container(
                        width: 300,
                        height: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: state.isAligned
                                ? Colors.green
                                : AppColors.goldColor,
                            width: 2,
                          ),
                          color: AppColors.blackColor.withOpacity(0.5),
                        ),
                      ),
                      // Rotating Needle
                      Transform.rotate(
                        angle: (qiblahDirection.qiblah * (pi / 180) * -1),
                        child: Icon(
                          Icons.navigation,
                          size: 150,
                          color: state.isAligned
                              ? Colors.green
                              : AppColors.goldColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "${qiblahDirection.offset.toStringAsFixed(2)}°",
                    style: const TextStyle(
                      color: AppColors.goldColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
