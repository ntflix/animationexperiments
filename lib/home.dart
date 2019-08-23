import 'package:flutter/material.dart';
import 'package:animation_experiments/custom/boxShadow.dart';
import 'dart:math';

class Page {
  final Widget route;
  final String name;
  final IconData icon;
  final int number;

  Page({
    @required
    this.route,
    @required
    this.name,
    @required
    this.icon,
    @required
    this.number
  });
}

class NavPage extends StatefulWidget {
  final String title;
  final List<Page> pages;

  NavPage({
    Key key,
    @required this.title,
    @required this.pages,
  }) : super(key: key);

  @override
  _NavPageState createState() {
    return _NavPageState();
  }
}

class _NavPageState extends State<NavPage> with SingleTickerProviderStateMixin {
  int _selectedPage = 0;
  Widget body = Container();

  AnimationController animationController;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() => setState(() {}));
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    );

    animationController.forward();

    this.body = widget.pages[_selectedPage].route;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: this.body,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Stack(
          children: <Widget>[
            Opacity(
            opacity: 0.5,
            child : Container(
              height: MediaQuery.of(context).size.height / 12,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: [CustomBoxShadow(
                    color: Colors.black,
                    offset: Offset(0.0, 8.0),
                    blurRadius: 10.0,
                    blurStyle: BlurStyle.outer
                  )]
                ),
              ),
            ),

           Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.pages.map((thisPage) =>
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () => setState(() {
                  _selectedPage = thisPage.number;
                  this.body = thisPage.route;
                  animationController.forward();
                }),
                child : AnimatedOpacity(
                  duration: Duration(milliseconds: 120),
                  opacity: _selectedPage == thisPage.number ? 1.0 : 0.5,
                  child : ScaleTransition(
                    scale: animation,
                    child: AnimatedContainer(
                      padding: EdgeInsets.fromLTRB(1, (_selectedPage == thisPage.number ? 10 : 12), 1, 0),
                      duration: Duration(milliseconds: 150),
                      height: _selectedPage == thisPage.number ? 40 : 34,
                      width: 100,
                      child : FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Icon(thisPage.icon),
                      ),
                    ),
                  ),
                ),
              ),
              ).toList()
            ),
          ],
        ),
      ),
    );
  }
}