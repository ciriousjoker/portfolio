import "package:flutter/material.dart";

class IconNormalizedWidget extends StatelessWidget {
  const IconNormalizedWidget({
    super.key,
    required this.icon,
    this.size = 20,
    required this.color,
  });

  final IconData icon;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: icon.fontFamily == "MaterialIcons" ? size : size * 0.9,
      color: color,
    );
  }
}
