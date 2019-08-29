import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  _WelcomeState createState() {
    return _WelcomeState();
  }
}

class _WelcomeState extends State<Welcome> with TickerProviderStateMixin {
  Future<bool> timer(Duration duration) async {
    await Future.delayed(duration);
    return true;
  }

  AnimationController _movementController;
  AnimationController _colorController;
  AnimationController _opacityController;
  Animation<double> _slideIn;
  Animation _color;

  @override
  void initState() {
    super.initState();
    _colorController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    _movementController = AnimationController(
        duration: Duration(milliseconds: 1100), vsync: this);
    _opacityController = AnimationController(
        duration: Duration(milliseconds: 1100), vsync: this);
    _color =
        ColorTween(begin: Colors.white, end: Color.fromRGBO(22, 34, 179, 1))
            .animate(_colorController);
    _opacityController.addListener(() {
      setState(() {});
    });
    _colorController.addListener(() {
      setState(() {});
    });
    _movementController
        .animateTo(1.0, curve: Curves.ease)
        .orCancel;
    _slideIn = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _movementController,
        curve: Curves.ease,
      ),
    );
    _opacityController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        timer(Duration(milliseconds: 1450)).then((_) {
          _opacityController.reverse();
          _colorController
              .forward()
              .orCancel;
        });
      }
    });
    _movementController
        .forward()
        .orCancel;
    _opacityController
        .forward()
        .orCancel;
  }

  @override
  void dispose() {
    _colorController.dispose();
    _movementController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double fontSize = 48.0;
    double opacity = _opacityController.value;
    double padding = MediaQuery.of(context).size.height * (0.4 * _slideIn.value) - fontSize;

    if (padding <= 0) {
      padding = 0;
      opacity = 0;
    }

    return Material(
      color: Colors.white,
      child : Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(0, padding, 0, 0),
        decoration: BoxDecoration(
          color: _color.value,
        ),
        child: Column(
          children: <Widget>[
            Opacity(
              opacity: opacity,
              child: Text("hi there", style: TextStyle(color: Colors.black87, fontSize: fontSize)),
            ),
          ],
        ),
      ),
    );
  }
}