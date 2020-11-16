import 'package:flutter/material.dart';
import 'package:portfolio/config/colors.config.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/rounded_border.widget.dart';
import 'package:portfolio/ui/widget/timeline/images.widget.dart';
import 'package:portfolio/ui/widget/timeline/project.widget.dart';
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

  final double _sizeIndicator = 64; // TimelineConfig.IndicatorSize
  final double _widthStroke = 4.0; // TimelineConfig.LineThickness

  bool get isLeft => index.isEven;

  @override
  Widget build(BuildContext context) {
    Widget projectWidget = Padding(
      padding: EdgeInsets.symmetric(vertical: 96),
      child: Align(
        alignment: context.isPortrait
            ? Alignment.center
            : isLeft
                ? Alignment.centerLeft
                : Alignment.centerRight,
        child: ProjectWidget(
          project: project,
        ),
      ),
    );

    Widget imageWidget = ImagesWidget(project: project);

    return Center(
      child: TimelineTile(
        alignment:
            context.isPortrait ? TimelineAlign.start : TimelineAlign.center,
        beforeLineStyle: LineStyle(
          color: ColorsConfig.timelineLine,
          thickness: _widthStroke,
        ),
        afterLineStyle: LineStyle(
          color: ColorsConfig.timelineLine,
          thickness: _widthStroke,
        ),
        indicatorStyle: IndicatorStyle(
          width: _sizeIndicator,
          padding: EdgeInsets.only(
            // horizontal: UIHelper.HorizontalSpaceMedium,
            left: context.isPortrait ? 0 : UIHelper.HorizontalSpaceMedium,
            right: context.isPortrait
                ? UIHelper.HorizontalSpaceSmall
                : UIHelper.HorizontalSpaceMedium,
            // right: UIHelper.HorizontalSpaceMedium,
            top: UIHelper.VerticalSpaceSmall,
            bottom: UIHelper.VerticalSpaceSmall,
          ),
          height: _sizeIndicator,
          indicator: RoundedBorderWidget(
            size: 2,
            color: ColorsConfig.timelineLine,
            child: (project.icon ?? "").isNotEmpty
                ? Container(
                    child: Image.asset(
                      "assets/icons/${project.icon}",
                      height: context.isPortrait ? 24 : 32,
                      width: context.isPortrait ? 24 : 32,
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ),
        startChild: context.isPortrait
            ? null
            : !isLeft
                ? projectWidget
                : imageWidget,
        endChild: (context.isPortrait || isLeft) ? projectWidget : imageWidget,
        isFirst: this.index == 0,
        isLast: this.index == this.count - 1,
      ),
    );
  }
}
