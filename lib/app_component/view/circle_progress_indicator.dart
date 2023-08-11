import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleProgressIndicator extends StatefulWidget {

  double progress = 0.6;
  double radius = 50;
  double progressWidth = 10;
  Color bgColor = Colors.blueAccent;

  CircleProgressIndicator({super.key,required this.progress,required this.radius,required this.progressWidth,required this.bgColor});

  @override
  State<CircleProgressIndicator> createState() => _CircleProgressIndicatorState();
}

class _CircleProgressIndicatorState extends State<CircleProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CircleProgressIndicatorPainter(progress: widget.progress, radius: widget.radius, bgColor: widget.bgColor, progressWidth: widget.progressWidth),
    );
  }
}

class CircleProgressIndicatorPainter extends CustomPainter {
  double progress = 0.6;
  double center = 0;
  double progressWidth = 10;
  double radius = 50;
  Color bgColor = Colors.blueAccent;

  CircleProgressIndicatorPainter({ Listenable? repaint,required this.progress,required this.radius, required this.progressWidth, required this.bgColor});

  @override
  void paint(Canvas canvas, Size size) {
    final angle = 360.0 * progress;
    // final double radians = degToRad(angle);
    // center 表示圆心位置
    // 圆心便宜位置计算：
    final offsetTmp = radius + progressWidth / 2.0;

    final offsetCenter = Offset(offsetTmp, offsetTmp);
    final aPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = bgColor
    ..strokeWidth = progressWidth
    ..strokeCap = StrokeCap.round;
    final Rect arcRect = Rect.fromCircle(center: offsetCenter, radius: radius,);
    // 0 度在 3点位置，pi 在9点 1.5pi 在12点位置
    canvas.drawArc(arcRect, pi * 1.5 , degToRad(angle), false, aPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  double degToRad(double deg) {
    return deg * (pi / 180.0);
  }

  double radToDeg(double rad) {
    return rad * (180.0 / pi);
  }
}