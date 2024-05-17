import "package:flutter/material.dart";
import "package:portfolio/fonts/brand_icons_minified_icons.dart";

class Tag {
  final String id;

  final String label;

  /// Fallback color if the technology doesn't exist in Github.
  final String colorHex;

  /// shields.io logo name. Only necessary if different from label.
  /// https://github.com/Ileriayo/markdown-badges
  final IconData icon;

  final String url;

  const Tag({
    required this.id,
    required this.label,
    required this.colorHex,
    required this.icon,
    required this.url,
  });
}

const List<Tag> tags = [
  Tag(
    id: "babylonjs",
    label: "BabylonJS",
    colorHex: "#e0684b",
    icon: BrandIconsMinified.babylonjs,
    url: "https://www.babylonjs.com/",
  ),
  Tag(
    id: "angular",
    label: "Angular",
    colorHex: "#cc002c",
    icon: BrandIconsMinified.angular,
    url: "https://angular.io/",
  ),
  Tag(
    id: "pwa",
    // Don't remove the space or it'll look cramped together
    label: " Progressive Web App",
    colorHex: "#5a0fc8",
    icon: BrandIconsMinified.progressive_web_app,
    url: "https://web.dev/progressive-web-apps/",
  ),
  Tag(
    id: "aurelia",
    label: "Aurelia",
    colorHex: "#ED2B88",
    icon: BrandIconsMinified.aurelia,
    url: "http://aurelia.io/",
  ),
  Tag(
    id: "typescript",
    label: "Typescript",
    icon: BrandIconsMinified.typescript,
    colorHex: "#3178c6",
    url: "https://www.typescriptlang.org/",
  ),
  Tag(
    id: "javascript",
    label: "Javascript",
    icon: BrandIconsMinified.javascript,
    colorHex: "#F7DF1E",
    url: "https://developer.mozilla.org/en-US/docs/Web/JavaScript",
  ),
  Tag(
    id: "webpack",
    label: "Webpack",
    icon: BrandIconsMinified.webpack,
    colorHex: "#1389FD",
    url: "https://webpack.js.org/",
  ),
  Tag(
    id: "flutter",
    label: "Flutter",
    icon: BrandIconsMinified.flutter,
    colorHex: "#1389FD",
    url: "https://flutter.dev/",
  ),
  Tag(
    id: "googletagmanager",
    label: "Google Tag Manager",
    icon: BrandIconsMinified.googletagmanager,
    colorHex: "#246FDB",
    url: "https://marketingplatform.google.com/about/tag-manager/",
  ),
  Tag(
    id: "googleanalytics",
    label: "Analytics",
    icon: BrandIconsMinified.googleanalytics,
    colorHex: "#E8710A",
    url: "https://marketingplatform.google.com/about/analytics/",
  ),
  Tag(
    id: "firebase",
    label: "Firebase",
    icon: BrandIconsMinified.firebase,
    colorHex: "#FFA000",
    url: "https://firebase.google.com/",
  ),
  Tag(
    id: "react",
    colorHex: "#20232a",
    icon: BrandIconsMinified.react,
    label: "React",
    url: "https://reactjs.org/",
  ),
  Tag(
    id: "csharp",
    label: "C#",
    icon: BrandIconsMinified.csharp,
    colorHex: "#3A0091",
    url: "https://docs.microsoft.com/en-us/dotnet/csharp/",
  ),
  Tag(
    id: "electron",
    label: "Electron",
    icon: BrandIconsMinified.electron,
    colorHex: "#2b2e3b",
    url: "https://www.electronjs.org/",
  ),
  Tag(
    id: "nodejs",
    label: "NodeJS",
    icon: BrandIconsMinified.node_dot_js,
    colorHex: "#026e00",
    url: "https://nodejs.org/",
  ),
  Tag(
    id: "unity",
    label: "Unity",
    icon: BrandIconsMinified.unity,
    colorHex: "#000000",
    url: "https://unity.com/",
  ),
  Tag(
    id: "c",
    label: "c",
    icon: BrandIconsMinified.c,
    colorHex: "#00599C",
    url: "https://en.wikipedia.org/wiki/C_(programming_language)",
  ),
  Tag(
    id: "java",
    label: "Java",
    colorHex: "#ED8B00",
    icon: BrandIconsMinified.java,
    url: "https://www.oracle.com/java/",
  ),
  Tag(
    id: "material_design_lite",
    label: "Material Design Lite",
    colorHex: "#2E2E2E",
    icon: BrandIconsMinified.materialdesign,
    url: "https://getmdl.io/",
  ),
  Tag(
    id: "material_design_components",
    label: "Material Design Components",
    colorHex: "#6200EE",
    icon: BrandIconsMinified.materialdesign,
    url: "https://material.io/develop/web/",
  ),
  Tag(
    id: "tailwind",
    label: "Tailwind",
    colorHex: "#06B6D4",
    icon: BrandIconsMinified.tailwindcss,
    url: "https://tailwindcss.com/",
  ),
  Tag(
    id: "ejs",
    label: "Embedded Javascript Templating",
    colorHex: "#90a93a",
    icon: BrandIconsMinified.javascript,
    url: "https://ejs.co/",
  ),
  Tag(
    id: "sqlite",
    label: "SQLite",
    icon: BrandIconsMinified.sqlite,
    colorHex: "#044a64",
    url: "https://www.sqlite.org/",
  ),
  Tag(
    id: "adobeaftereffects",
    label: "After Effects",
    icon: BrandIconsMinified.adobeaftereffects,
    colorHex: "#00005b",
    url: "https://www.adobe.com/products/aftereffects",
  ),
];
