import 'package:flutter/material.dart';

class IconNormalizedWidget extends StatelessWidget {
  const IconNormalizedWidget({
    Key key,
    this.icon,
    this.size = 20,
    this.color,
  }) : super(key: key);

  final IconData icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: icon.fontFamily == "MaterialIcons" ? size : size * 0.87,
      color: color,
    );
  }
}
