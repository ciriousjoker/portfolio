import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/card/card.widget.dart';
import 'package:portfolio/ui/widget/timeline/timeline.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: Padding(
        padding: EdgeInsets.all(UIHelper.VerticalSpaceMedium),
        child: context.isPortrait
            ? CustomScrollView(
                shrinkWrap: true,
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      UIHelper.verticalSpaceMedium(),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CardWidget(),
                        ],
                      ),
                      UIHelper.verticalSpaceMedium(),
                    ]),
                  ),
                  TimelineWidget()
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  UIHelper.horizontalSpaceMedium(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CardWidget(),
                    ],
                  ),
                  UIHelper.horizontalSpaceMedium(),
                  Expanded(
                    child: CustomScrollView(
                      slivers: <Widget>[TimelineWidget()],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
