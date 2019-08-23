import 'package:flutter/material.dart';
import 'package:animation_experiments/animations/background.dart';

class Animation1 extends StatefulWidget {
  Animation1({Key key}) : super(key: key);

  @override
  _Animation1State createState() {
    return _Animation1State();
  }
}

class _Animation1State extends State<Animation1> {
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
    return Opacity(
      opacity: 1,
      child: AnimatedGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        gradients: [
          GradientInfo(
            duration: Duration(seconds: 3),
            colors: [Color(0xffD38312), Colors.lightBlueAccent],
          ),
          GradientInfo(
            duration: Duration(seconds: 6),
            colors: [Colors.greenAccent, Color(0xffA83279)],
          )
        ],
      ),
    );
  }
}