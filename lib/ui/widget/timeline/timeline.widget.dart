import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/models/colors.model.dart';
import 'package:portfolio/ui/widget/timeline/timeline_tile.widget.dart';
import 'package:provider/provider.dart';

class TimelineWidget extends StatelessWidget {
  const TimelineWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProjectData> projects = ProjectConfig.projects.toList();
    projects.sort((a, b) => b.date - a.date);

    return FutureProvider(
      create: (_) async {
        String data = await DefaultAssetBundle.of(context)
            .loadString("assets/github-colors/colors.json");
        dynamic colors = json.decode(data);
        // await Future.delayed(Duration(seconds: 3));
        return ColorModel(colors: colors);
      },
      child: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (context.watch<ColorModel>() == null) {
                  return Center(
                      child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ));
                }

                return TimelineTileWidget(
                  project: projects[index],
                  index: index,
                  count: projects.length,
                );
              },
              childCount: projects.length,
            ),
          )
        ],
      ),
    );
  }
}
