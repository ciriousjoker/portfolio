import 'package:flutter/material.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/ui/widget/timeline/timeline_tile.widget.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProjectData> projects = ProjectConfig.projects.toList();
    projects.sort((a, b) => b.timestamp - a.timestamp);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return TimelineTileWidget(
            project: projects[index],
            index: index,
            count: projects.length,
          );
        },
        childCount: projects.length,
      ),
    );
  }
}
