import "package:flutter/material.dart";
import "package:portfolio/config/colors.config.dart";
import "package:portfolio/config/ui.config.dart";
import "package:portfolio/models/project.model.dart";
import "package:portfolio/ui/helper/ui.helper.dart";
import "package:portfolio/ui/widget/timeline/project/project_card.widget.dart";
import "package:portfolio/ui/widget/util/markdown_wrapper.widget.dart";

class ProjectBackWidget extends StatefulWidget {
  final ProjectModel project;
  final Widget? flipHint;

  const ProjectBackWidget({
    super.key,
    required this.project,
    required this.flipHint,
  });

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
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.project.learningsTldr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    verticalSpaceSmall,
                    MarkdownWrapperWidget(
                      data: widget.project.learnings,
                    ),
                  ],
                ),
              ),
              if (widget.flipHint != null) ...[
                horizontalSpaceSmall,
                Container(
                  width: 1,
                  height: UIConfig.projectDividerHeight,
                  color: ColorsConfig.projectDivider,
                ),
                horizontalSpaceSmall,
                widget.flipHint!,
              ],
            ],
          ),
          verticalSpaceSmall,
        ],
      ),
    );
  }
}
