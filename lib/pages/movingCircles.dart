import 'package:flutter/material.dart';
import 'package:animation_experiments/custom/shapesPainter.dart';
import 'package:animation_experiments/custom/dots.dart';

class MovingDots extends StatefulWidget {
  MovingDots({Key key}) : super(key: key);

  @override
  _MovingDotsState createState() {
    return _MovingDotsState();
  }
}

class _MovingDotsState extends State<MovingDots> {
  List<Circle> circles = new List<Circle>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    return Container(
//      child: CustomPaint(
//        painter: RandomDots(circles: this.circles),
//        child: Container(),
//      ),
//    );
    return Container();
  }
}