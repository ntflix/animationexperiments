import 'package:flutter/material.dart';
import 'package:animation_experiments/home.dart';
import 'package:animation_experiments/pages/animation1.dart';
import 'package:animation_experiments/pages/movingCircles.dart';
import 'package:animation_experiments/pages/boxes.dart';
import 'package:animation_experiments/pages/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final List<Page> _pages = [
    Page(
      route: Welcome(),
      name: "Welcome",
      icon: Icons.tag_faces,
      number: 0,
    ),
    Page(
      route: Boxes(),
      name: "1st",
      icon: Icons.filter_1,
      number: 1,
    ),
    Page(
      route: Animation1(),
      name: "Drawing",
      icon: Icons.filter_2,
      number: 2,
    ),
    Page(
      route: MovingDots(),
      name: "Boxes",
      icon: Icons.filter_3,
      number: 3,
    ),
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

