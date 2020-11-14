import 'package:flutter/material.dart';
import 'package:portfolio/ui/widget/timeline/timeline.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // if (context.orientation == Orientation.portrait) {
    return Scaffold(
      body: TimelineWidget(),
    );
    // return TimelineWidget();
    // return Column(
    //   children: [
    //     CardWidget(),
    //     UIHelper.verticalSpaceMedium(),
    //     // TimelineWidget(),
    //     Expanded(child: TimelineWidget())
    //   ],
    // );
    // } else {
    //   return Row(
    //     children: [CardWidget()],
    //   );
    // }
  }
}
