import 'package:flutter/material.dart';

class WidgetSlideUpDownFadeAnimation extends StatelessWidget {
  final Duration duration;
  final Offset offset;
  final bool direction;
  final Widget child;

  const WidgetSlideUpDownFadeAnimation(
      {Key key, this.duration, this.offset, this.direction, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: duration,
      opacity: direction ? 1 : 0,
      curve: direction ? Curves.easeIn : Curves.easeOut,
      child: AnimatedContainer(
        duration: duration,
        transform: direction
            ? Matrix4.translationValues(0, 0, 0)
            : Matrix4.translationValues(offset.dx, offset.dy, 0),
        curve: direction ? Curves.linear : Curves.linear,
        child: child,
      ),
    );
  }
}
