import "package:delayed_display/delayed_display.dart";
import "package:flutter/material.dart";
import "package:portfolio/ui/helper/ui.helper.dart";
import "package:portfolio/ui/widget/card/card.widget.dart";
import "package:portfolio/ui/widget/timeline/timeline.widget.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = ScrollController();

  final card = const DelayedDisplay(
    fadingDuration: Duration(seconds: 2),
    slidingCurve: Curves.easeOutCubic,
    slidingBeginOffset: Offset(0, 0.1),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CardWidget(),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kVerticalSpaceMedium,
        ),
        child: isVertical(context)
            ? CustomScrollView(
                controller: _controller,
                shrinkWrap: true,
                clipBehavior: Clip.none,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        verticalSpaceMedium,
                        card,
                        verticalSpaceMedium,
                      ],
                    ),
                  ),
                  const TimelineWidget(),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  horizontalSpaceMedium,
                  card,
                  horizontalSpaceMedium,
                  Expanded(
                    child: _delayed(
                      CustomScrollView(
                        controller: _controller,
                        clipBehavior: Clip.none,
                        shrinkWrap: true,
                        slivers: const <Widget>[TimelineWidget()],
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _delayed(Widget child) {
    return DelayedDisplay(
      delay: const Duration(milliseconds: 100),
      fadingDuration: const Duration(seconds: 2),
      slidingCurve: Curves.easeOutCubic,
      slidingBeginOffset: const Offset(0, 0.1),
      child: child,
    );
  }
}
