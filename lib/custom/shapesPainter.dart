import 'package:flutter/material.dart';
import 'package:animation_experiments/custom/dots.dart';

class ShapesPainter extends CustomPainter {
  Color color;
  double radius;

  ShapesPainter({
    @required
    this.color,
    @required
    this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = this.color;
    var center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, this.radius, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class RandomDots extends CustomPainter {
  List<Circle> circles;

  RandomDots({
    @required
    this.circles
  });

  @override
  void paint(Canvas canvas, Size size) {
    for (var circle in circles) {
      canvas.drawCircle(circle.position, circle.radius, circle.paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}