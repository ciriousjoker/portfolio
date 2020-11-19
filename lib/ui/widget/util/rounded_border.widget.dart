import 'package:flutter/material.dart';

class RoundedBorderWidget extends StatelessWidget {
  const RoundedBorderWidget({
    Key key,
    @required this.color,
    @required this.child,
    @required this.size,
    this.elevation = 0,
  }) : super(key: key);

  final Color color;
  final Widget child;
  final double size;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: color,
          width: size,
        ),
      ),
      child: Material(
        type: MaterialType.circle,
        clipBehavior: Clip.antiAlias,
        color: color,
        elevation: elevation,
        child: child,
      ),
    );
  }
}
