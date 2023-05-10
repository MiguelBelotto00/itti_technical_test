import 'package:flutter/material.dart';

class CustomBackgroundWidget extends StatelessWidget {
  const CustomBackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: CustomBackgroundPainter(),
      ),
    );
  }
}

class CustomBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    final Path path = Path();

    //Properties
    paint.color = const Color(0xFF2266e2);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 3.0;

    path.lineTo(0, size.height * 0.35);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.40,
        size.width * 0.5, size.height * 0.35);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.30, size.width, size.height * 0.35);
    path.lineTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
