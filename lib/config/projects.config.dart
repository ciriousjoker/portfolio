import 'package:flutter/material.dart';
import 'package:portfolio/brand_icons/brand_icons_icons.dart';

class ProjectConfig {
  static const List<ProjectData> projects = [
    ProjectData(
      title: "StarClock",
      description:
          "This is my entry for the [Flutter Clock Face Contest](https://flutter.dev/clock)."
          "The goal was to create a clock face for upcoming Lenovo Smart clocks."
          "My clock got a top 25 placement & I won a Lenovo Smart clock :)",
      urlDemo: "https://www.youtube.com/watch?v=ZuHLtdbaXqc",
      githubName: "star_clock",
      date: 2019,
      tags: [
        Tags.flutter,
      ],
      screenshots: [
        "TODO:",
      ],
    ),
    ProjectData(
      title: "ShadyVault",
      description: "Provides an encrypted filesystem for Chrome OS."
          "TODO: ...",
      urlWebsite: "https://shadyvault.web.app/",
      date: 2019,
      tags: [
        Tags.aurelia,
      ],
      screenshots: [
        "TODO:",
      ],
    ),
    ProjectData(
      title: "Perfect Decision Finder",
      description: "Make the perfect decision"
          "TODO: ...",
      urlPlaystore:
          "https://play.google.com/store/apps/details?id=com.ciriousjoker.perfect_decision_finder",
      date: 2019,
      tags: [
        Tags.flutter,
      ],
      screenshots: [
        "TODO:",
      ],
    ),
    ProjectData(
      title: "Pokeroute",
      description: "App for Pokemon GO players"
          "TODO: ...",
      githubName: "pokeroute",
      urlWebsite: "https://pokeroute.web.app/",
      date: 2019,
      tags: [
        Tags.flutter,
      ],
      screenshots: [
        "TODO:",
      ],
    ),
    ProjectData(
      title: "Am I Done Yet",
      description: "App for Flutter contest."
          "TODO: ...",
      githubName: "Am-I-Done-Yet",
      urlPlaystore: "TODO: ",
      date: 2019,
      tags: [
        Tags.flutter,
      ],
      screenshots: [
        "assets/screenshots/projects/sidenote/1.png",
      ],
    ),
    ProjectData(
      title: "ShufflePaper",
      description: "A wallpaper manager for Chrome OS."
          "TODO: ...",
      // githubName: "Am-I-Done-Yet",
      urlWebsite: "https://shufflepaper.web.app/",
      date: 2017,
      tags: [
        Tags.javascript,
        Tags.css,
        Tags.html,
      ],
      screenshots: [
        "assets/screenshots/projects/sidenote/1.png",
      ],
    ),
    ProjectData(
      title: "Legacy Manager & Legacy Uploader",
      description: "A mod manager for Super Smash Bros. Brawl Legacy XP."
          "Download & install the latest release of the game."
          "Legacy Uploader is used to package & upload new releases."
          "While the source code still works, this tool never got support from"
          "the community, so now it's abandoned.",
      githubName: "HomingCompass",
      urlDownload:
          "https://github.com/CiriousJoker/nTradeAdvanced/releases/latest",
      date: 2017,
      tags: [
        Tags.react,
        Tags.cSharp,
      ],
      screenshots: [
        "assets/screenshots/projects/sidenote/1.png",
      ],
    ),
    ProjectData(
      title: "HomingCompass",
      description:
          "A homescreen widget that always points towards home (or any other location you specify).\n\n"
          "Was a parting gift for a friend who travelled abroad :)",
      githubName: "HomingCompass",
      urlDownload:
          "https://github.com/CiriousJoker/nTradeAdvanced/releases/latest",
      date: 2017,
      tags: [
        Tags.java,
      ],
      screenshots: [
        "assets/screenshots/projects/sidenote/1.png",
      ],
    ),
    ProjectData(
      title: "NXTProject",
      description:
          "This project consists of two parts, the NXTBurner (Windows) & the NXTPlayer (Lego + Java)."
          "NXTBurner is used to create disks. Once you printed them & glued them onto cardboard,"
          "you can play them back using the NXTPlayer."
          "You create a special disk using the NXTBurner, print it"
          "and glue it onto cardboard. Then, you can play it back using the NXTPlayer."
          ""
          "This was created as part of a school project where we got to create robots with the Lego NXT."
          "Most chose to build one of the suggested project ideas,"
          "but I always wanted one as a kid and never got it,"
          "so I used this opportunity to catch up a lot of things :)",
      githubName: "HomingCompass",
      urlDownload:
          "https://github.com/CiriousJoker/nTradeAdvanced/releases/latest",
      date: 2017,
      tags: [
        Tags.java,
      ],
      screenshots: [
        "assets/screenshots/projects/sidenote/1.png",
      ],
    ),
    ProjectData(
      title: "nTradeAdvanced",
      description: """
TODO:
- asd
""",
      githubName: "nTradeAdvanced",
      urlDownload:
          "https://github.com/CiriousJoker/nTradeAdvanced/releases/latest",
      date: 2016,
      tags: [
        Tags.c,
      ],
      screenshots: [
        "TODO:",
      ],
    ),
//     ProjectData(
//       title: "nTradeAdvanced",
//       description: """
// Test
// - asd
// """,
//       githubName: "nTradeAdvanced",
//       urlDownload:
//           "https://github.com/CiriousJoker/nTradeAdvanced/releases/latest",
//       year: 2014,
//       tags: [
//         Tag(colorHex: "#ff0000", label: "C"),
//       ],
//     ),
  ];
}

class ProjectData {
  // TODO: Add logo (optional?)

  final String title;
  final String githubName;
  final String description;
  final String urlImage;
  final String urlDownload;
  final String urlDemo;
  final String urlPlaystore;
  final String urlWebsite;

  // TODO: Change to DateTime
  final int date;
  final List<Tag> tags;
  final List<String> screenshots;

  const ProjectData({
    this.title,
    this.githubName,
    this.description = "",
    this.urlImage,
    this.urlDemo,
    this.urlPlaystore,
    this.urlDownload,
    this.urlWebsite,
    this.date,
    this.tags = const [],
    this.screenshots = const [],
  });
}

class Tags {
  static const Tag aurelia = Tag(
    label: "Aurelia",
    colorHex: "#ED2B88",
    icon: BrandIcons.aurelia,
  );
  static const Tag typescript = Tag(
    label: "Typescript",
    icon: BrandIcons.typescript,
    colorHex: "#F7DF1E",
  );
  static const Tag javascript = Tag(
    label: "Javascript",
    icon: BrandIcons.javascript,
    colorHex: "#F7DF1E",
  );
  static const Tag css = Tag(
    label: "CSS3",
    icon: BrandIcons.css3,
    colorHex: "#1572B6",
  );
  static const Tag html = Tag(
    label: "html",
    icon: BrandIcons.html5,
    colorHex: "#E34F26",
  );
  static const Tag flutter = Tag(
    label: "Flutter",
    icon: BrandIcons.flutter,
    colorHex: "#1389FD",
  );

  static const Tag react = Tag(
    colorHex: "#20232a",
    icon: BrandIcons.react,
    label: "React",
  );
  static const Tag cSharp = Tag(
    label: "C#",
    icon: BrandIcons.csharp,
    colorHex: "#3A0091",
  );
  static const Tag c = Tag(
    label: "c",
    icon: BrandIcons.c,
    colorHex: "#00599C",
  );
  static const Tag java = Tag(
    label: "Java",
    colorHex: "#ED8B00",
    icon: BrandIcons.java,
  );
// Tag(colorHex: "#ff0000", label: "Java")
  // Tag(label: "C#", logo: "c-sharp"),
}

class Tag {
  final String label;

  /// Fallback color if the technology doesn't exist in Github.
  final String colorHex;

  /// Github language name (to retrieve color).
  /// Only necessary if different from label.
  final String github;

  /// shields.io logo name. Only necessary if different from label.
  /// https://github.com/Ileriayo/markdown-badges
  final IconData icon;

  const Tag(
      {@required this.label, @required this.colorHex, this.github, this.icon});

  String get getGithub => github ?? label;
  // String get getLogo => icon ?? label.toLowerCase();
}
