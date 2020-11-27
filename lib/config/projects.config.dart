import 'package:flutter/material.dart';
import 'package:portfolio/brand_icons/brand_icons_icons.dart';

class ProjectConfig {
  static const List<ProjectData> projects = [
    // TODO: Didactduell
    // TODO: Switchboard website
    ProjectData(
      title: "Tag My Knowledge",
      description: "TODO:",
      learningsTldr: "UX, web design, analytics",
      learnings: """
- Some bullet
- points
- wohoo!2
- wohoo!
- wohoo!1
- wohoo!
- wohoo!2
- wohoo!
- wohoo!2
- wohoo!
- wohoo!1
""",
      urlWebsite: "https://tagmyknowledge.com/",
      urlPlaystore:
          "https://play.google.com/store/apps/details?id=com.tagmyknowledge",
      // Aug 2020
      timestamp: 1596924000000,
      tags: [
        Tags.flutter,
        Tags.firebase,
        Tags.googletagmanager,
        Tags.googleanalytics,
      ],
      icon: "tagmyknowledge.png",
      // screenshots: [
      //   "TODO:",
      // ],
      platforms: [
        BrandIcons.googleplay,
        BrandIcons.googlechrome,
      ],
    ),
    ProjectData(
      title: "AlgoDat GUI",
      description:
          "Small project that I built during a group project to showcase our datastructure implementations.\n"
          "Now, following semesters can fork this and don't have to write console applications for that.",
      githubName: "algodat_gui",
      // Aug 2020
      timestamp: 1596751200000,
      tags: [
        Tags.csharp,
      ],
      icon: "algodat_gui.png",
      // screenshots: [
      //   "TODO:",
      // ],
      platforms: [
        BrandIcons.windows,
      ],
    ),

    ProjectData(
      title: "Website Redesign for Switchboard Live",
      description:
          "Switchboard Live is a multistreaming service to stream one input to multiple platforms at once. "
          "As a freelancer, my job was (among other things) to completely redesign "
          "their website to make the most out of the rising covid 19 traffic. "
          "I had pretty much full control over everything (layout, graphics, text) "
          "except for the video, which already existed. \n\n"
          "**Here's the comparison:**<br>"
          "[snapshot before the relaunch](https://web.archive.org/web/20200314094119/https://switchboard.live/)<br>"
          "[snapshot right before my contract ended](https://web.archive.org/web/20200909094059/https://switchboard.live/)\n"
          "The current website is also linked below, "
          "although keep in mind that it might look different by now.",
      learningsTldr: "tailwindcss, ejs, webpack, netlify, google tag manager",
      learnings: "- **Netlify:** Deploy directly from the git repository\n"
          "- **TailwindCss:** Styling exclusively via utility classes instead of \"real\" css\n"
          "- **Webpack:** Build pipeline, in this case for a static website\n"
          "- **Embedded Javascript Templating:** Build .html out of .ejs templates (which can contain js to parse Markdown etc.)\n"
          "- **Frontmatter + Markdown:** The \"data structure\" of the blog posts.\n"
          "\nAside from these technical details, I also improved my copywriting skills.",
      // 20th Mar 2020
      timestamp: 1584658800000,
      urlWebsite: "https://switchboard.live/",
      tags: [
        Tags.tailwind,
        Tags.googletagmanager,
        Tags.webpack,
        Tags.ejs,
      ],
      icon: "switchboard.png",
      // screenshots: [
      //   "TODO:",
      // ],
      platforms: [
        BrandIcons.googlechrome,
      ],
    ),
//
//

    ProjectData(
      title: "StarClock",
      description:
          "This is my entry for the [Flutter Clock Face Contest](https://flutter.dev/clock)."
          "The goal was to create a clock face for upcoming Lenovo Smart clocks."
          "My clock got a top 25 placement & I won a Lenovo Smart clock :)",
      urlDemo: "https://www.youtube.com/watch?v=ZuHLtdbaXqc",
      githubName: "star_clock",
      // Dec 2019
      timestamp: 1577055600000,
      tags: [
        Tags.flutter,
      ],
      icon: "starclock.png",
      // screenshots: [
      //   "TODO:",
      // ],
      platforms: [
        BrandIcons.android,
      ],
    ),
    ProjectData(
      title: "Friday Night Survival",
      description:
          "Friday Night Survival was developed as a group project at the"
          "\"Technische Hochschule Nuremberg\" (a German university of applied science).\n"
          "It's a round based, 2D-RPG with a top-down overworld map.\n"
          "There some ways it's similar to Pokémon, but in a nightclub,\nwith crude humor"
          "and interesting battle mechanics based on an \"honor level\".\n"
          "Also, sometimes your only option is to drink your opponent under the table.\n"
          "My job was mainly to create the non-character assets as well as "
          "the \"club feeling\" (mainly lighting & overworld animations).\n"
          "I also balanced the game difficulty & managed our Trello board.\n",
      // urlPlaystore:
      //     "https://play.google.com/store/apps/details?id=com.tagmyknowledge",
      urlDemo: "TODO:",
      githubName: "TODO:",
      // Nov 2019
      timestamp: 1572735600000,
      tags: [
        Tags.unity,
        Tags.csharp,
      ],
      icon: "fridaynightsurvival.png",
      // screenshots: [
      //   "TODO:",
      // ],
      platforms: [
        BrandIcons.googlechrome,
        BrandIcons.windows,
        BrandIcons.linux,
        // TODO: Mac os?
      ],
    ),
    ProjectData(
      title: "ShadyVault",
      description: "Provides an encrypted filesystem for Chrome OS."
          "TODO: ...",
      urlWebsite: "https://shadyvault.web.app/",
      // Apr 2019
      timestamp: 1555538400000,
      tags: [
        Tags.aurelia,
      ],
      icon: "shadyvault.png",
      // screenshots: [
      //   "TODO:",
      // ],
      platforms: [
        BrandIcons.googlechrome,
      ],
    ),
    ProjectData(
      title: "Perfect Decision Finder",
      description: "Make the perfect decision"
          "TODO: ...",
      urlPlaystore:
          "https://play.google.com/store/apps/details?id=com.ciriousjoker.perfect_decision_finder",
      // Aug 2019
      timestamp: 1567202400000,
      tags: [
        Tags.flutter,
      ],
      icon: "perfectdecisionfinder.png",
      // screenshots: [
      //   "TODO:",
      // ],
      platforms: [
        BrandIcons.googleplay,
      ],
    ),
    ProjectData(
      title: "Pokeroute",
      description: "App for Pokémon GO players"
          "TODO: ...",
      githubName: "pokeroute",
      urlWebsite: "https://pokeroute.web.app/",
      // Aug 2019
      timestamp: 1566770400000,
      tags: [
        Tags.flutter,
        Tags.firebase,
      ],
      icon: "pokeroute.png",
      // screenshots: [
      //   "TODO:",
      // ],
      platforms: [
        BrandIcons.googlechrome,
      ],
    ),
    ProjectData(
      title: "Am I Done Yet",
      description: "App for Flutter contest."
          "TODO: ...",
      githubName: "Am-I-Done-Yet",
      urlPlaystore: "TODO: ",
      // Mar 2019
      timestamp: 1552604400000,
      icon: "amidoneyet.png",
      tags: [
        Tags.flutter,
        Tags.firebase,
      ],
      // TODO:
      // screenshots: [
      //   "assets/screenshots/projects/sidenote/1.png",
      // ],
      platforms: [
        BrandIcons.googleplay,
      ],
    ),
    ProjectData(
      title: "ShufflePaper",
      description: "A wallpaper manager for Chrome OS."
          "TODO: ...",
      urlWebsite: "https://shufflepaper.web.app/",
      // Mar 2017
      timestamp: 1488668400000,
      tags: [
        Tags.javascript,
        Tags.css,
        Tags.html,
      ],
      icon: "shufflepaper.png",
      // screenshots: [
      // TODO:
      // "assets/screenshots/projects/sidenote/1.png",
      // ],
      platforms: [
        BrandIcons.googlechrome,
      ],
    ),
    ProjectData(
      title: "Legacy Manager/Uploader",
      description: "A mod manager for Super Smash Bros. Brawl Legacy XP."
          "Download & install the latest release of the game."
          "Legacy Uploader is used to package & upload new releases."
          "While the source code still works, this tool didn't catch on in"
          "the community, so now it's abandoned.",
      // TODO: Project now closed
      githubName: "legacymanager",
      urlDownload:
          "https://github.com/CiriousJoker/legacymanager/releases/latest",
      // Aug. 2017
      timestamp: 1502143200000,
      icon: "legacyxp.png",
      tags: [
        Tags.react,
        Tags.csharp,
      ],
      // screenshots: [
      // TODO:
      //   "assets/screenshots/projects/sidenote/1.png",
      // ],
      platforms: [
        BrandIcons.windows,
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
      githubName: "nxtburner.png",
      // 27th May 2017
      timestamp: 1495843200000,
      tags: [
        Tags.csharp,
        Tags.java,
      ],
      icon: "nxtburner.png",
      platforms: [
        BrandIcons.windows,
        Icons.developer_board_outlined,
      ],
      // screenshots: [
      //   "assets/screenshots/projects/sidenote/1.png",
      // ],
    ),
    ProjectData(
      title: "Homing Compass",
      description:
          "A homescreen widget that always points towards home (or any other location you specify). "
          "You can switch between multiple locations and the widget displays the direction and distance.\n\n"
          "Was a parting gift for a friend who travelled abroad :)",
      learningsTldr: "Android, widgets, GPS, threads",
      learnings: "- Using GPS & the Maps api\n"
          "- Creating widgets\n"
          "- Update the widget from a background thread\n"
          "- Calculating orientation & distance on a sphere\n",
      githubName: "HomingCompass",
      urlPlaystore:
          "https://play.google.com/store/apps/details?id=com.ciriousjoker.homingcompass",
      // 23rd Sept. 2016
      timestamp: 1474636718000,
      tags: [
        Tags.java,
      ],
      platforms: [BrandIcons.googleplay],
      icon: "homingcompass.png",
      // screenshots: [
      //   "assets/screenshots/projects/sidenote/1.png",
      // ],
    ),
    ProjectData(
        title: "SideNote",
        description:
            "This program was my first attempt at C#/.NET + WPF, after being fascinated by the UI "
            "of a tool called Curse Voice, "
            "which was written in it (at least according to their open hiring positions at the time).\n"
            "**Features:**\n"
            "- Note is automatically saved\n"
            "- shift+tab: Slide in/out from the right screen edge\n"
            "- Settings: font family, font size & color theme",
        learningsTldr:
            "Introduction to C#, .NET, WPF, animations & state management",
        learnings: "- C# .NET development for Windows\n"
            "- Designing a GUI in WPF\n"
            "- Basic animations, concept of easing & animation curves\n"
            "- Basic state management to reflect settings changes "
            "like color themes immediately without restarting",
        githubName: "SideNote",
        urlDownload: "https://github.com/CiriousJoker/SideNote/releases/latest",
        // Nov. 2015
        timestamp: 1446332400000,
        tags: [
          Tags.csharp,
        ],
        icon: "sidenote.png",
        // screenshots: [
        //   "TODO:",
        // ],
        platforms: [BrandIcons.windows]),
    ProjectData(
        title: "nTradeAdvanced",
        description:
            "A program for the Ti-Nspire CAS calculator, which allows you to trade Pokémon between two third gen Pokémon games. "
            "Once you've rooted your device using Ndless, you can install a GBA emulator and play Pokémon. "
            "There is no link functionality available, but with this tool, you can trade Pokémon anyway. "
            "Just transfer the .sav files, run this tool, and trade Pokémon between them. "
            "I also included a little tool to fix corrupted save states, which could be caused by cheating."
            "**Supported games:** Firered/Leafgreen, Ruby/Sapphire, Emerald",
        learningsTldr: "c, pointer arithmetic, checksums",
        learnings: """
- Developed in c
- Basics of embedded programming with tight hardware constraints
- Understanding inofficial reverse-engineered documentation about save formats
- Pointer arithmetic to modify the savestates in-memory
- Recalculating checksums to repair a corrupted save file
""",
        githubName: "nTradeAdvanced",
        urlDownload:
            "https://github.com/CiriousJoker/nTradeAdvanced/releases/latest",
        // 25th July 2014
        timestamp: 1406246400000,
        tags: [
          Tags.c,
        ],
        icon: "ntradeadvanced.png",
        platforms: [
          Icons.calculate,
        ]
        // screenshots: [
        //   "TODO:",
        // ],
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
  final String title;
  final String githubName;
  final String description;
  final String learningsTldr;
  final String learnings;
  final String urlImage;
  final String urlDownload;
  final String urlDemo;
  final String urlPlaystore;
  final String urlWebsite;

  // filename in assets/icons/*
  final String icon;

  /// Unix epoch timestamp
  final int timestamp;
  final List<Tag> tags;
  final List<String> screenshots;
  final List<IconData> platforms;

  const ProjectData({
    @required this.title,
    @required this.timestamp,
    @required this.icon,
    this.githubName,
    this.description = "",
    this.learningsTldr = "",
    this.learnings = "",
    this.urlImage,
    this.urlDemo,
    this.urlPlaystore,
    this.urlDownload,
    this.urlWebsite,
    this.platforms = const [],
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

  static const Tag webpack = Tag(
    label: "Webpack",
    icon: BrandIcons.webpack,
    colorHex: "#1389FD",
  );

  static const Tag flutter = Tag(
    label: "Flutter",
    icon: BrandIcons.flutter,
    colorHex: "#1389FD",
  );

  static const Tag googletagmanager = Tag(
    label: "Google Tag Manager",
    icon: BrandIcons.googletagmanager,
    colorHex: "#246FDB",
  );

  static const Tag googleanalytics = Tag(
    label: "Analytics",
    icon: BrandIcons.googleanalytics,
    colorHex: "#E8710A",
  );

  static const Tag firebase = Tag(
    label: "Firebase",
    icon: BrandIcons.firebase,
    colorHex: "#FFA000",
  );

  static const Tag react = Tag(
    colorHex: "#20232a",
    icon: BrandIcons.react,
    label: "React",
  );
  static const Tag csharp = Tag(
    label: "C#",
    icon: BrandIcons.csharp,
    colorHex: "#3A0091",
  );

  static const Tag unity = Tag(
    label: "Unity",
    icon: BrandIcons.unity,
    colorHex: "#000000",
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

  static const Tag material_design_components = Tag(
    label: "Material Design Components",
    colorHex: "#6200EE",
    icon: BrandIcons.materialdesign,
  );

  static const Tag tailwind = Tag(
    label: "Tailwind",
    colorHex: "#06B6D4",
    icon: BrandIcons.tailwindcss,
  );

  static const Tag ejs = Tag(
    label: "Embedded Javascript Templating",
    colorHex: "#90a93a",
    icon: BrandIcons.javascript,
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
  // final String github;

  /// shields.io logo name. Only necessary if different from label.
  /// https://github.com/Ileriayo/markdown-badges
  final IconData icon;

  const Tag({
    @required this.label,
    @required this.colorHex,
    @required this.icon,
  });
}
