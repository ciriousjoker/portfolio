import 'package:flutter/material.dart';
import 'package:portfolio/config/colors.config.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/config/ui.config.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/util/rounded_border.widget.dart';
import 'package:portfolio/ui/widget/timeline/project/project.widget.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimelineTileWidget extends StatelessWidget {
  const TimelineTileWidget({
    Key key,
    @required this.project,
    @required this.index,
    @required this.count,
  }) : super(key: key);

  final ProjectData project;
  final int index;
  final int count;

  bool get isLeft => index.isEven;

  @override
  Widget build(BuildContext context) {
    final bool isDense = UIHelper.isDense(context);

    Widget widgetProject = Padding(
      padding: EdgeInsets.symmetric(vertical: UIConfig.timelineProjectSpacing),
      child: Align(
        alignment: isDense
            ? Alignment.center
            : isLeft
                ? Alignment.centerLeft
                : Alignment.centerRight,
        child: ProjectWidget(
          project: project,
          index: index,
        ),
      ),
    );

    Widget widgetNotProject = SizedBox.shrink();
    if (index == 0) {
      widgetNotProject = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Click on the cards to view technical details and learnings",
              style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 20,
                    color: ColorsConfig.timelineHint,
                  ),
            ),
          ],
        ),
      );
    }

    return Center(
      child: TimelineTile(
        alignment: isDense ? TimelineAlign.start : TimelineAlign.center,
        beforeLineStyle: LineStyle(
          color: ColorsConfig.timelineLine,
          thickness: UIConfig.timelineLineThickness,
        ),
        afterLineStyle: LineStyle(
          color: ColorsConfig.timelineLine,
          thickness: UIConfig.timelineLineThickness,
        ),
        indicatorStyle: IndicatorStyle(
          width: UIConfig.timelineIndicatorSize,
          padding: EdgeInsets.only(
            left: isDense ? 0 : UIHelper.HorizontalSpaceMedium,
            right: isDense
                ? UIHelper.HorizontalSpaceSmall
                : UIHelper.HorizontalSpaceMedium,
            top: UIHelper.VerticalSpaceSmall,
            bottom: UIHelper.VerticalSpaceSmall,
          ),
          height: UIConfig.timelineIndicatorSize,
          indicator: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ColorsConfig.timelineGlow,
                  blurRadius: UIConfig.timelineGlowBlurRadius,
                  spreadRadius: 0.5,
                )
              ],
            ),
            child: RoundedBorderWidget(
              size: UIConfig.timelineLineThickness,
              color: ColorsConfig.timelineLine,
              child: (project.icon ?? "").isNotEmpty
                  ? Image.asset(
                      "assets/icons/${project.icon}",
                      isAntiAlias: true,
                      filterQuality: FilterQuality.high,
                    )
                  : SizedBox.shrink(),
            ),
          ),
        ),
        startChild: isDense
            ? null
            : !isLeft
                ? widgetProject
                : widgetNotProject,
        endChild: (isDense || isLeft) ? widgetProject : widgetNotProject,
        isFirst: this.index == 0,
        isLast: this.index == this.count - 1,
      ),
    );
  }
}
