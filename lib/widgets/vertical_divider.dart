import 'package:flutter/material.dart';

class DashedVerticalDivider extends StatelessWidget {
  const DashedVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(1, 160), // Adjust the height of the divider
      painter: DashedDividerPainter(),
    );
  }
}

class DashedDividerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const double dashWidth = 6.0; // Width of each dash
    const double dashSpace = 4.0; // Space between each dash
    double yOffset = 0.0;

    // Draw dashed line from top to bottom
    while (yOffset < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, yOffset),
        Offset(size.width / 2, yOffset + dashWidth),
        paint,
      );
      yOffset += dashWidth + dashSpace; // Spacing between dashes
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
