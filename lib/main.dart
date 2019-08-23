import 'package:flutter/material.dart';
import 'package:animation_experiments/home.dart';
import 'package:animation_experiments/pages/animation1.dart';
import 'package:animation_experiments/pages/movingCircles.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final List<Page> _pages = [
    Page(
      route: Animation1(),
      name: "1st",
      icon: Icons.filter_1,
      number: 0,
    ),
    Page(
      route: MovingDots(),
      name: "Drawing",
      icon: Icons.filter_2,
      number: 1,
    ),
    Page(
      route: Animation1(),
      name: "3rd",
      icon: Icons.filter_3,
      number: 2,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NavPage(title: 'Animations', pages: _pages),
    );
  }
}

