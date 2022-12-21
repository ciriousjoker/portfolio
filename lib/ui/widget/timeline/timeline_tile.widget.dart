import "package:flutter/material.dart";
import "package:portfolio/config/colors.config.dart";
import "package:portfolio/config/ui.config.dart";
import "package:portfolio/models/project.model.dart";
import "package:portfolio/ui/helper/ui.helper.dart";
import "package:portfolio/ui/widget/timeline/project/project.widget.dart";
import "package:portfolio/ui/widget/util/rounded_border.widget.dart";
import "package:timeline_tile/timeline_tile.dart";

class TimelineTileWidget extends StatelessWidget {
  const TimelineTileWidget({
    super.key,
    required this.project,
    required this.index,
    required this.count,
  });

  final ProjectModel project;
  final int index;
  final int count;

  bool get isLeft => index.isEven;

  @override
  Widget build(BuildContext context) {
    final bool dense = isDense(context);

    final Widget widgetProject = Padding(
      padding: const EdgeInsets.symmetric(vertical: UIConfig.timelineProjectSpacing),
      child: Align(
        alignment: dense
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

    Widget widgetNotProject = const SizedBox.shrink();
    if (index == 0) {
      widgetNotProject = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Click on the cards to view technical details and learnings",
              style: Theme.of(context).textTheme.headline4?.copyWith(
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
        alignment: dense ? TimelineAlign.start : TimelineAlign.center,
        beforeLineStyle: const LineStyle(
          color: ColorsConfig.timelineLine,
          thickness: UIConfig.timelineLineThickness,
        ),
        afterLineStyle: const LineStyle(
          color: ColorsConfig.timelineLine,
          thickness: UIConfig.timelineLineThickness,
        ),
        indicatorStyle: IndicatorStyle(
          width: UIConfig.timelineIndicatorSize,
          padding: EdgeInsets.only(
            left: dense ? 0 : kHorizontalSpaceMedium,
            right: dense ? kHorizontalSpaceSmall : kHorizontalSpaceMedium,
            top: kVerticalSpaceSmall,
            bottom: kVerticalSpaceSmall,
          ),
          height: UIConfig.timelineIndicatorSize,
          indicator: DecoratedBox(
            decoration: const BoxDecoration(
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
              child: Image.asset(
                "assets/icons/${project.icon}",
                isAntiAlias: true,
                errorBuilder: (context, error, stackTrace) => const Text("Icon missing"),
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ),
        startChild: dense
            ? null
            : !isLeft
                ? widgetProject
                : widgetNotProject,
        endChild: (dense || isLeft) ? widgetProject : widgetNotProject,
        isFirst: index == 0,
        isLast: index == count - 1,
      ),
    );
  }
}
