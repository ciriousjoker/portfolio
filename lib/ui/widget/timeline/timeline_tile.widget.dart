import 'package:flutter/material.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/config/timeline.config.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/timeline/images.widget.dart';
import 'package:portfolio/ui/widget/timeline/project.widget.dart';
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

  final double _sizeIndicator = 64; // TimelineConfig.IndicatorSize
  final double _widthStroke = 4.0; // TimelineConfig.LineThickness

  bool get isLeft => index.isEven;

  @override
  Widget build(BuildContext context) {
    Widget projectWidget = Padding(
      padding: EdgeInsets.symmetric(vertical: 96),
      child: Align(
        alignment: isLeft ? Alignment.centerLeft : Alignment.centerRight,
        child: ProjectWidget(
          project: project,
        ),
      ),
    );

    Widget imageWidget = ImagesWidget(project: project);

    return TimelineTile(
      alignment: TimelineAlign.center,
      beforeLineStyle: LineStyle(
        color: Theme.of(context).primaryColor,
        thickness: _widthStroke,
      ),
      afterLineStyle: LineStyle(
        color: Theme.of(context).primaryColor,
        thickness: _widthStroke,
      ),
      indicatorStyle: IndicatorStyle(
        width: _sizeIndicator,
        padding: EdgeInsets.symmetric(
          horizontal: UIHelper.HorizontalSpaceMedium,
          vertical: _widthStroke,
        ),
        height: _sizeIndicator,
        indicator: Container(
          // foregroundDecoration: BoxDecoration(
          //   border: Border.fromBorderSide(
          //     BorderSide(
          //       color: Theme.of(context).primaryColor,
          //       width: TimelineConfig.LineThickness,
          //     ),
          //   ),
          //   shape: BoxShape.circle,
          // ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          clipBehavior: Clip.antiAlias,
          child: (project.icon ?? "").isNotEmpty
              ? Container(
                  color: Colors.white,
                  child: Image.asset(
                    "assets/icons/${project.icon}",
                    // "https://play-lh.googleusercontent.com/aEoUb80IVMui5g9xqi3BZBUUKxkPZLzFbHqoK8GgJVNqdYFibqA9QpVi0unZcmK573wD=s360-rw",
                    height: 32,
                    width: 32,
                  ),
                )
              : SizedBox.shrink(),
          // Image.network(
          //   "https://play-lh.googleusercontent.com/aEoUb80IVMui5g9xqi3BZBUUKxkPZLzFbHqoK8GgJVNqdYFibqA9QpVi0unZcmK573wD=s360-rw",
          //   height: 32,
          //   width: 32,
          // ),
        ),
        // indicator: Container(
        //   decoration: BoxDecoration(
        //     color: Colors.white,
        //     border: Border.fromBorderSide(
        //       BorderSide(
        //         color: Colors.grey,
        //         width: TimelineConfig.LineThickness,
        //       ),
        //     ),
        //     shape: BoxShape.circle,
        //   ),
        //   child: Center(
        //     child: Text(project.date?.toString() ?? ""),
        //   ),
        // ),
      ),
      startChild: !isLeft ? projectWidget : imageWidget,
      endChild: isLeft ? projectWidget : imageWidget,
      isFirst: this.index == 0,
      isLast: this.index == this.count - 1,
    );
  }
}
