import 'dart:async';

import 'package:flip_card/flip_card.controller.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/ui/widget/timeline/project/project_back.widget.dart';
import 'package:portfolio/ui/widget/timeline/project/project_front.widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({
    Key key,
    this.project,
    this.index,
  }) : super(key: key);

  final ProjectData project;
  final int index;

  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  String keyDebounce;
  FlipCardController _controller;
  Widget _btnFlipHint;
  bool isFlipping = false;

  @override
  void initState() {
    super.initState();
    keyDebounce = "_skewCard_24bn78535758" + hashCode.toString();

    _controller = FlipCardController();

    _btnFlipHint = widgetBtnFlipHint();
    showHint();
  }

  MouseRegion widgetBtnFlipHint() {
    return MouseRegion(
      child: IconButton(
        icon: Icon(Icons.flip),
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
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      controller: _controller,
      // TODO: Parameter
      speed: 750,
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
    );
  }

  void showHint() async {
    if (widget.index != 0) return;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = "isSeen_24857bh638967hn63";
    bool isSeen = prefs.getBool(key) ?? false;
    if (isSeen) return;

    Timer(
      // TODO: Parameter
      Duration(seconds: 2),
      () async {
        if (!mounted) return;
        // TODO: Parameter
        _controller.hint(
          duration: Duration(milliseconds: 300),
          total: Duration(milliseconds: 3500),
        );
        await prefs.setBool(key, true);
      },
    );
  }

  void _skew(double value) {
    if (isFlipping) return;

    Timer(
      Duration(milliseconds: 50),
      () {
        _controller.skew(
          value,
          // TODO: Parameter
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      },
    );
  }
}
