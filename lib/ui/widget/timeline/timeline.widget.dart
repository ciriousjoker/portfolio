import "dart:convert";

import "package:flutter/material.dart";
import "package:portfolio/models/projects.model.dart";
import "package:portfolio/ui/widget/timeline/timeline_tile.widget.dart";

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString("assets/projects.json"),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SliverFillRemaining(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        // final Map<String, dynamic> data = json.decode(snapshot.data!);

        final data = ProjectsModel.fromJson(json.decode(snapshot.data!) as Map<String, dynamic>);

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return TimelineTileWidget(
                project: data.projects[index],
                index: index,
                count: data.projects.length,
              );
            },
            childCount: data.projects.length,
          ),
        );
      },
    );
  }
}
