import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/card/card.widget.dart';
import 'package:portfolio/ui/widget/timeline/timeline.widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final card = DelayedDisplay(
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
        padding: EdgeInsets.symmetric(
          horizontal: UIHelper.VerticalSpaceMedium,
        ),
        child: UIHelper.isVertical(context)
            ? CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        UIHelper.verticalSpaceMedium(),
                        card,
                        UIHelper.verticalSpaceMedium(),
                      ],
                    ),
                  ),
                  TimelineWidget(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UIHelper.horizontalSpaceMedium(),
                  card,
                  UIHelper.horizontalSpaceMedium(),
                  Expanded(
                    child: _delayed(
                      CustomScrollView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        slivers: <Widget>[TimelineWidget()],
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
      delay: Duration(milliseconds: 100),
      fadingDuration: Duration(seconds: 2),
      slidingCurve: Curves.easeOutCubic,
      slidingBeginOffset: Offset(0, 0.1),
      child: child,
    );
  }
}
