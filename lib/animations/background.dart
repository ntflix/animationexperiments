import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class GradientInfo {
  final Duration duration;
  final List<Color> colors;

  GradientInfo({
    @required
    this.duration,
    this.colors
  });
}

class AnimatedGradient extends StatelessWidget {
  final List<GradientInfo> gradients;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  AnimatedGradient({
    Key key,
    @required
    this.gradients,
    this.begin,
    this.end
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final animationTween = MultiTrackTween([
      Track("topColor").add(gradients[0].duration, ColorTween(begin: gradients[0].colors[0], end: gradients[0].colors[1])),
      Track("bottomColor").add(gradients[1].duration, ColorTween(begin: gradients[1].colors[0], end: gradients[1].colors[1])),
    ]);

    return ControlledAnimation(
      playback: Playback.MIRROR,
      tween: animationTween,
      duration: animationTween.duration,
      builder: (BuildContext context, animation) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: this.begin,
              end: this.end,
              colors: [animation["topColor"], animation["bottomColor"]]
            ),
          ),
        );
      },
    );
  }
}
