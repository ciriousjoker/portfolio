import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:portfolio/config/colors.config.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/config/ui.config.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/timeline/project/project_card.widget.dart';

class ProjectBackWidget extends StatefulWidget {
  final ProjectData project;
  final Widget flipHint;

  const ProjectBackWidget({
    Key key,
    @required this.project,
    this.flipHint,
  }) : super(key: key);

  @override
  _ProjectBackWidgetState createState() => _ProjectBackWidgetState();
}

class _ProjectBackWidgetState extends State<ProjectBackWidget> {
  @override
  Widget build(BuildContext context) {
    return ProjectCardWidget(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              UIConfig.projectHeadline,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        widget.project.learningsTldr,
                        style: Theme.of(context).textTheme.caption,
                      ),
                      UIHelper.verticalSpaceSmall(),
                      ...MarkdownGenerator(
                        data: widget.project.learnings,
                        styleConfig: StyleConfig(
                          pConfig: PConfig(
                            textStyle: Theme.of(context).textTheme.bodyText2,
                          ),
                          ulConfig: UlConfig(
                            dotMargin: EdgeInsets.only(right: 8),
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ),
                      ).widgets,
                    ]),
              ),
              UIHelper.horizontalSpaceSmall(),
              Container(
                width: 1,
                height: UIConfig.projectDividerHeight,
                color: ColorsConfig.projectDivider,
              ),
              UIHelper.horizontalSpaceSmall(),
              widget.flipHint,
            ],
          ),
          UIHelper.verticalSpaceSmall(),
        ],
      ),
    );
  }
}
