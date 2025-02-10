import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../utils/screen_size_extension.dart';

class GradientCircle extends StatelessWidget {
  final double progress;
  final double strokeWidth;
  final double size;

  const GradientCircle({
    super.key,
    required this.progress,
    this.strokeWidth = 20.0,
    this.size = 91.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.widthPercent(size),
      height: context.heightPercent(size),
      child: CustomPaint(
        painter: _GradientCirclePainter(
          progress: progress,
          strokeWidth: strokeWidth,
        ),
      ),
    );
  }
}

class _GradientCirclePainter extends CustomPainter {
  final double progress;
  final double strokeWidth;

  _GradientCirclePainter({
    required this.progress,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2);

    final backgroundPaint = Paint()
      ..color = Colors.grey[300]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    const gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xff3498DB),
        Color(0xffC2E8FF),
      ],
    );

    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradientPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final sweepAngle = 2 * math.pi * progress;

    canvas.drawArc(
      rect,
      -math.pi / 2,
      sweepAngle,
      false,
      gradientPaint,
    );
  }

  @override
  bool shouldRepaint(_GradientCirclePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
