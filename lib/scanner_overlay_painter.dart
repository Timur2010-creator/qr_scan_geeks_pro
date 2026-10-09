import 'package:flutter/material.dart';

class ScannerOverlayPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double cornerLength;
  final double cornerRadius;

  ScannerOverlayPainter({
    required this.color,
    this.strokeWidth = 4.5,
    this.cornerLength = 36.0,
    this.cornerRadius = 14.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final width = size.width;
    final height = size.height;

    final path = Path()
      // Top-Left
      ..moveTo(0, cornerLength)
      ..lineTo(0, cornerRadius)
      ..quadraticBezierTo(0, 0, cornerRadius, 0)
      ..lineTo(cornerLength, 0)
      // Top-Right
      ..moveTo(width - cornerLength, 0)
      ..lineTo(width - cornerRadius, 0)
      ..quadraticBezierTo(width, 0, width, cornerRadius)
      ..lineTo(width, cornerLength)
      // Bottom-Left
      ..moveTo(0, height - cornerLength)
      ..lineTo(0, height - cornerRadius)
      ..quadraticBezierTo(0, height, cornerRadius, height)
      ..lineTo(cornerLength, height)
      // Bottom-Right
      ..moveTo(width - cornerLength, height)
      ..lineTo(width - cornerRadius, height)
      ..quadraticBezierTo(width, height, width, height - cornerRadius)
      ..lineTo(width, height - cornerLength);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant ScannerOverlayPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.cornerLength != cornerLength ||
        oldDelegate.cornerRadius != cornerRadius;
  }
}