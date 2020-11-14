import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/card.widget.dart';
import 'package:portfolio/ui/widget/timeline/timeline.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.orientation == Orientation.portrait) {
      // return TimelineWidget();
      // return Column(
      //   children: [
      //     CardWidget(),
      //     UIHelper.verticalSpaceMedium(),
      //     // TimelineWidget(),
      //     Expanded(child: TimelineWidget())
      //   ],
      // );
    } else {
      // return Row(
      //   children: [CardWidget()],
      // );
    }
    return Scaffold(
      body: context.orientation == Orientation.portrait
          ? Column(
              children: [
                CardWidget(),
                TimelineWidget(),
              ],
            )
          :
          // TimelineWidget()
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                UIHelper.horizontalSpaceLarge(),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CardWidget(),
                  ],
                ),
                // Spacer(),
                UIHelper.horizontalSpaceLarge(),
                Expanded(child: TimelineWidget()),
              ],
            ),
    );
  }
}
