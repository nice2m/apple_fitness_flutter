import 'package:apple_fitness_flutter/components/circle_progress_indicator.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class SummaryScreenProgressIndicator extends StatelessWidget {
  double progress;
  double radius = 60;
  double progressWidth = 20;
  Color bgColor = AppColor.primaryRed.withAlpha(25);
  Color forColor = AppColor.primaryRed;
  SummaryScreenProgressIndicator({super.key,required this.progress});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleProgressIndicator(progress: 1, radius: radius, bgColor: bgColor, progressWidth: progressWidth,),
        TweenAnimationBuilder(
          duration: const Duration(seconds: 3),
          tween: Tween(begin: 0.0, end: progress),
          builder: (BuildContext context, value, Widget? child) { 
            return CircleProgressIndicator(progress: value, radius: radius, bgColor: forColor,progressWidth: progressWidth,);
          },),
          // rive animated
          const Positioned(
            top: 0,
            left: (140 - 10) / 2.0,
            width: 20,
            height: 20,
            child: RiveAnimation.asset('assets/animation/Rive/red-circle-arrow.riv')
          ),
      ],
    );
  }
}