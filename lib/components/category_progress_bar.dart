import 'package:flutter/material.dart';

class SemiCircularProgressBar extends StatefulWidget {
  final double progress;
  final Color color;

  SemiCircularProgressBar({
    required this.progress,
    required this.color,
  });

  @override
  _SemiCircularProgressBarState createState() => _SemiCircularProgressBarState();
}

class _SemiCircularProgressBarState extends State<SemiCircularProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 100.0,
      child: CustomPaint(
        painter: SemiCirclePainter(
          progress: widget.progress,
          color: widget.color,
        ),
      ),
    );
  }
}

class SemiCirclePainter extends CustomPainter {
  final double progress;
  final Color color;

  SemiCirclePainter({
    required this.progress,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color // Use the provided color
      ..strokeWidth = 22.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double centerX = size.width / 2;
    final double centerY = size.height;
    final double radius = size.width / 2;

    final double startAngle = 3.14;
    final double sweepAngle = 2 * 3.14 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      startAngle,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}