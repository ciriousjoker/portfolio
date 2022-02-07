import "dart:async";

import "package:flip_card/flip_card.dart";
import "package:flip_card/flip_card_controller.dart";
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
    Key? key,
    required this.project,
    required this.index,
  }) : super(key: key);

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
        tooltip: "Flip",
        onPressed: () {
          _controller.toggleCard();
        },
      ),
      onEnter: (event) {
        _skew(0.1);
      },
      onExit: (event) {
        _skew(0);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: kHorizontalSpaceSmall),
      child: FlipCard(
        controller: _controller,
        speed: UIConfig.projectFlipDuration.inMilliseconds,
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

    Timer(
      UIConfig.projectHintDelay,
      () async {
        if (!mounted) return;
        _controller.hint(
          duration: UIConfig.projectFlipHintDuration,
          total: UIConfig.projectFlipHintTotal,
        );
        await prefs.setBool(key, true);
      },
    );
  }

  void _skew(double value) {
    if (isFlipping) return;

    Timer(
      const Duration(milliseconds: 50),
      () {
        _controller.skew(
          value,
          duration: UIConfig.projectFlipHintDuration,
          curve: Curves.easeIn,
        );
      },
    );
  }
}
