import 'package:flutter/material.dart';
import 'package:animation_experiments/animations/background.dart';

class Box {
  Color color;
  Duration duration;
  double left;
  double top;
  Size size;

  Box({
    this.color,
    this.duration,
    this.left,
    this.top,
    this.size
  });
}

class Boxes extends StatefulWidget {
  Boxes({Key key}) : super(key: key);

  @override
  _BoxesState createState() {
    return _BoxesState();
  }
}

class _BoxesState extends State<Boxes> {
  var containerSize = new Size(300, 300);
  var boxes = List<Box>();

  @override
  void initState() {
    Size boxSize = Size(100.0, 100.0);

    boxes.add(new Box(color: Colors.indigo, duration: Duration(seconds: 1), left: 20, top:  (containerSize.height) - (boxSize.height + 20), size: boxSize));
    boxes.add(new Box(color: Colors.blue, duration: Duration(seconds: 1), left: (containerSize.width) - (boxSize.width + 20), top: 20, size: boxSize));

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () {
          for (int i = 0; i < boxes.length; i++) {
            var thisBox = boxes[i];
            print("Start: left: " + thisBox.left.toString() + ", top: " + thisBox.top.toString());
            if (thisBox.left == 20 && thisBox.top == 20) {
              var box2 = Box(
                  color: thisBox.color,
                  duration: thisBox.duration,
                  left: (containerSize.width) - (thisBox.size.width + 20),
                  top: (containerSize.height) - (thisBox.size.height + 20),
                  size: thisBox.size
              );
              boxes.removeAt(i);
              boxes.add(box2);
            } else {
              if (thisBox.left ==
                  (containerSize.width) - (thisBox.size.width + 20)) {
                thisBox.left = 20;
              }
              if (thisBox.top ==
                  (containerSize.height) - (thisBox.size.height + 20)) {
                thisBox.top = 20;
              }
            }
            print("End: left: " + thisBox.left.toString() + ", top: " + thisBox.top.toString());
          }
          print("---------------------------------");
          setState(() {});
        },
        child : Stack(
          children: [
            SizedBox(
              width: containerSize.width,
              height: containerSize.height,
              child: Container(
  //              color: Colors.yellow,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(1),
                  border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid,)
                ),
              ),
            ),
            AnimatedPositioned(
              left: boxes[0].left,
              top: boxes[0].top,
              width: 100.0,
              height: 100.0,
              duration: boxes[0].duration,
              child: Container(
                child: AnimatedGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  gradients: [
                    GradientInfo(
                      duration: Duration(seconds: 3),
                      colors: [boxes[0].color, Colors.redAccent],
                    ),
                    GradientInfo(
                      duration: Duration(milliseconds: 6000),
                      colors: [Colors.purpleAccent, boxes[0].color],
                    )
                  ],
                ),
              ),
            ),
            AnimatedPositioned(
              left: boxes[1].left,
              top: boxes[1].top,
              width: 100.0,
              height: 100.0,
              duration: boxes[1].duration,
              child: Container(
                child: AnimatedGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  gradients: [
                    GradientInfo(
                      duration: Duration(seconds: 3),
                      colors: [boxes[1].color, Colors.lightBlueAccent],
                    ),
                    GradientInfo(
                      duration: Duration(milliseconds: 4500),
                      colors: [Colors.greenAccent, boxes[1].color],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}