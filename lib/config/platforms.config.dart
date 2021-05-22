import 'package:flutter/material.dart';
import 'package:portfolio/fonts/brand_icons_minified_icons.dart';
import 'package:portfolio/fonts/material_icons_minified_icons.dart';

class Platform {
  final String id;

  final String label;

  final IconData icon;

  const Platform({
    required this.id,
    required this.label,
    required this.icon,
  });
}

List<Platform> platforms = [
  Platform(
    id: "playstore",
    label: "Play Store",
    icon: BrandIconsMinified.googleplay,
  ),
  Platform(
    id: "ios",
    label: "iOS",
    icon: BrandIconsMinified.apple,
  ),
  Platform(
    id: "web",
    label: "Web",
    icon: BrandIconsMinified.googlechrome,
  ),
  Platform(
    id: "windows",
    label: "Windows",
    icon: BrandIconsMinified.windows,
  ),
  Platform(
    id: "mac",
    label: "Mac OS",
    icon: BrandIconsMinified.apple,
  ),
  Platform(
    id: "linux",
    label: "Linux",
    icon: BrandIconsMinified.linux,
  ),
  Platform(
    id: "chromeos",
    label: "Chrome OS",
    icon: BrandIconsMinified.googlechrome,
  ),
  Platform(
    id: "calculator",
    label: "Calculator",
    icon: MaterialIconsMinified.calculator_variant,
  ),
  Platform(
    id: "embedded",
    label: "Embedded System",
    icon: MaterialIconsMinified.developer_board,
  )
];
