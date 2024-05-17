import "dart:async";

import "package:flip_card/flip_card.dart";
import "package:flutter/material.dart";
import "package:portfolio/config/ui.config.dart";
import "package:portfolio/fonts/material_icons_minified_icons.dart";
import "package:portfolio/models/project.model.dart";
import "package:portfolio/ui/helper/ui.helper.dart";
import "package:portfolio/ui/widget/timeline/project/project_back.widget.dart";
import "package:portfolio/ui/widget/timeline/project/project_front.widget.dart";
import "package:shared_preferences/shared_preferences.dart";

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    super.key,
    required this.project,
    required this.index,
  });

  final ProjectModel project;
  final int index;

  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  late String keyDebounce;
  late FlipCardController _controller;
  late Widget _btnFlipHint;
  bool isFlipping = false;

  @override
  void initState() {
    super.initState();
    keyDebounce = "_skewCard_24bn78535758$hashCode";

    _controller = FlipCardController();

    _btnFlipHint = widgetBtnFlipHint();
    showHint();
  }

  MouseRegion widgetBtnFlipHint() {
    return MouseRegion(
      child: IconButton(
        icon: const Icon(MaterialIconsMinified.flip_horizontal),
        color: Colors.black12,
        mouseCursor: MouseCursor.defer,
        tooltip: "Flip",
        onPressed: () {
          _controller.flip();
        },
      ),
      // NOTE: Currently disabled because it seems like mouse events aren't detected properly
      // when using Transforms. onEnter & onExit are called at the same time on every frame during the animation.
      // Perhaps relevant:
      // https://github.com/flutter/flutter/issues/45789
      // onEnter: (event) {
      //   _skew(0.1);
      // },
      // onExit: (event) {
      //   _skew(0);
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalSpaceSmall),
      child: FlipCard(
        controller: _controller,
        duration: UIConfig.projectFlipDuration,
        onFlip: () => isFlipping = true,
        onFlipDone: (_) => isFlipping = false,
        back: ProjectBackWidget(
          project: widget.project,
          flipHint: _btnFlipHint,
        ),
        front: ProjectFrontWidget(
          project: widget.project,
          flipHint: _btnFlipHint,
        ),
      ),
    );
  }

  Future<void> showHint() async {
    if (widget.index != 0) return;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    const String key = "isSeen_24857bh638967hn63";
    final bool isSeen = prefs.getBool(key) ?? false;
    if (isSeen) return;

    await Future.delayed(UIConfig.projectHintDelay);

    if (!mounted) return;
    _controller.hint(
      target: 0.15,
      duration: UIConfig.projectFlipHintDuration,
    );
    await prefs.setBool(key, true);
  }

  // void _skew(double value) {
  //   if (isFlipping) return;

  //   Timer(
  //     const Duration(milliseconds: 50),
  //     () {
  //       _controller.skew(
  //         value,
  //         duration: UIConfig.projectFlipHintDuration,
  //         curve: Curves.easeIn,
  //       );
  //     },
  //   );
  // }
}
