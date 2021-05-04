import 'package:flutter/material.dart';

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashHeight = 1, dashSpace = 2.4, startY = 3;
    final paint = Paint()
      ..color = Colors.white;
    while (startY < size.height) {
      canvas.drawCircle(Offset(0, startY), dashHeight, paint);
      startY += dashHeight * 2 + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
