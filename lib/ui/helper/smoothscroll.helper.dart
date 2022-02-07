import "package:flutter/gestures.dart";
import "package:flutter/material.dart";

// Forked from:
// https://gitlab.com/dezso15/smoothscrollweb/
// and added null safety.

const int _kDefaultNormalScrollAnimationLengthMs = 250;
const int _kDefaultScrollSpeed = 130;

class SmoothScrollWeb extends StatefulWidget {
  final ValueChanged<PointerDeviceKind>? onDeviceTypeChange;

  ///Same ScrollController as the child widget's.
  final ScrollController controller;

  ///Child scrollable widget.
  final Widget child;

  ///Scroll speed px/scroll.
  final int scrollSpeed;

  ///Scroll animation length in milliseconds.
  final int scrollAnimationLength;

  ///Curve of the animation.
  final Curve curve;

  const SmoothScrollWeb({
    required this.controller,
    required this.child,
    this.onDeviceTypeChange,
    this.scrollSpeed = _kDefaultScrollSpeed,
    this.scrollAnimationLength = _kDefaultNormalScrollAnimationLengthMs,
    this.curve = Curves.linear,
  });

  @override
  State<SmoothScrollWeb> createState() => _SmoothScrollWebState();
}

class _SmoothScrollWebState extends State<SmoothScrollWeb> {
  double _scroll = 0;

  PointerDeviceKind _pointerKind = PointerDeviceKind.touch;

  @override
  Widget build(BuildContext context) {
    widget.controller.addListener(() {
      if (!widget.controller.position.isScrollingNotifier.value) {
        _scroll = widget.controller.position.extentBefore;
      }
    });

    return Listener(
      onPointerDown: (PointerDownEvent event) {
        if (_pointerKind != event.kind) {
          _pointerKind = event.kind;
          widget.onDeviceTypeChange?.call(event.kind);
        }

        _scroll = widget.controller.position.extentBefore;
      },
      onPointerSignal: (event) {
        if (_pointerKind != event.kind) {
          _pointerKind = event.kind;
          widget.onDeviceTypeChange?.call(event.kind);
        }

        if (_pointerKind != PointerDeviceKind.mouse) return;

        int millis = widget.scrollAnimationLength;
        if (event is PointerScrollEvent) {
          if (event.scrollDelta.dy > 0) {
            _scroll += widget.scrollSpeed;
          } else {
            _scroll -= widget.scrollSpeed;
          }
          if (_scroll > widget.controller.position.maxScrollExtent) {
            _scroll = widget.controller.position.maxScrollExtent;
            millis = widget.scrollAnimationLength ~/ 2;
          }
          if (_scroll < 0) {
            _scroll = 0;
            millis = widget.scrollAnimationLength ~/ 2;
          }

          widget.controller.animateTo(
            _scroll,
            duration: Duration(milliseconds: millis),
            curve: widget.curve,
          );
        }
      },
      child: widget.child,
    );
  }
}
