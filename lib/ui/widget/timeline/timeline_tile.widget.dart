import 'package:flutter/material.dart';
import 'package:portfolio/config/colors.config.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/config/ui.config.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/util/rounded_border.widget.dart';
import 'package:portfolio/ui/widget/timeline/project/project.widget.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:get/get.dart';

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
    Widget widgetProject = Padding(
      padding: EdgeInsets.symmetric(vertical: UIConfig.timelineProjectSpacing),
      child: Align(
        alignment: context.isPortrait
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

    return Center(
      child: TimelineTile(
        alignment:
            context.isPortrait ? TimelineAlign.start : TimelineAlign.center,
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
            left: context.isPortrait ? 0 : UIHelper.HorizontalSpaceMedium,
            right: context.isPortrait
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
                  ? Container(
                      child: Image.asset("assets/icons/${project.icon}"),
                    )
                  : SizedBox.shrink(),
            ),
          ),
        ),
        startChild: context.isPortrait
            ? null
            : !isLeft
                ? widgetProject
                : widgetNotProject,
        endChild:
            (context.isPortrait || isLeft) ? widgetProject : widgetNotProject,
        isFirst: this.index == 0,
        isLast: this.index == this.count - 1,
      ),
    );
  }
}
