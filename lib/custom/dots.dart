import 'dart:math';

import 'package:flutter/material.dart';

class Circle extends Shape {
  final double radius;

  Circle({Offset position, Paint paint, this.radius}) : super(position, paint);
}

abstract class Shape {
  Offset position;
  final Paint paint;

  Shape(
    this.position,
    this.paint
  );

  void moveABit() {
    var random = new Random();

    this.position = Offset(
      this.position.dx + (random.nextDouble() * (random.nextBool() ? 1 : -1)),
      this.position.dy + (random.nextDouble() * (random.nextBool() ? 1 : -1))
    );
  }
}