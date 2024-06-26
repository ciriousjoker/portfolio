import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:portfolio/config/colors.config.dart";
import "package:portfolio/config/general.config.dart";
import "package:portfolio/config/platforms.config.dart";
import "package:portfolio/config/ui.config.dart";
import "package:portfolio/fonts/material_icons_minified_icons.dart";
import "package:portfolio/models/project.model.dart";
import "package:portfolio/ui/helper/ui.helper.dart";
import "package:portfolio/ui/widget/timeline/button.widget.dart";
import "package:portfolio/ui/widget/timeline/project/project_card.widget.dart";
import "package:portfolio/ui/widget/util/chip.widget.dart";
import "package:portfolio/ui/widget/util/icon_normalized.widget.dart";
import "package:portfolio/ui/widget/util/markdown_wrapper.widget.dart";

class ProjectFrontWidget extends StatefulWidget {
  final ProjectModel project;
  final Widget? flipHint;

  const ProjectFrontWidget({
    super.key,
    required this.project,
    required this.flipHint,
  });

  @override
  _ProjectFrontWidgetState createState() => _ProjectFrontWidgetState();
}

class _ProjectFrontWidgetState extends State<ProjectFrontWidget> {
  late DateTime date;
  late List<Widget> listActions;

  bool get hasDemo => (widget.project.urlDemo ?? "").isNotEmpty;
  bool get hasDownload => (widget.project.urlDownload ?? "").isNotEmpty;
  bool get hasGithub => (widget.project.githubName ?? "").isNotEmpty;
  bool get hasPlaystore => (widget.project.urlPlaystore ?? "").isNotEmpty;
  bool get hasWebsite => (widget.project.urlWebsite ?? "").isNotEmpty;

  @override
  void initState() {
    super.initState();
    date = DateTime.fromMillisecondsSinceEpoch(widget.project.timestamp);

    listActions = [];
    if (hasDemo) {
      listActions.add(
        ButtonWidget(
          label: "Demo",
          tooltip: "Try a demo on your browser",
          url: widget.project.urlDemo!,
        ),
      );
    }

    if (hasDownload) {
      listActions.add(
        ButtonWidget(
          icon: MaterialIconsMinified.download,
          label: "Download",
          tooltip: "Download the latest release",
          url: widget.project.urlDownload!,
        ),
      );
    }

    if (hasPlaystore) {
      listActions.add(
        ButtonWidget(
          icon: MaterialIconsMinified.open_in_new,
          isIconTrailing: true,
          label: "Play Store",
          tooltip: "Available in the Play Store",
          url: widget.project.urlPlaystore!,
        ),
      );
    }

    if (hasGithub) {
      listActions.add(
        ButtonWidget(
          icon: MaterialIconsMinified.open_in_new,
          isIconTrailing: true,
          label: "Github",
          tooltip: "View the source code",
          // Github brand color
          color: const Color(0xFF333333),
          url: "https://github.com/${GeneralConfig.github}/${widget.project.githubName}",
        ),
      );
    }

    if (hasWebsite) {
      listActions.add(
        ButtonWidget(
          icon: MaterialIconsMinified.open_in_new,
          isIconTrailing: true,
          label: "Website",
          tooltip: "This project has a website",
          url: widget.project.urlWebsite!,
        ),
      );
    }
  }

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
                child: Text(
                  widget.project.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 3,
                ),
              ),
              ...widget.project.platforms.map(
                (platformId) {
                  final Platform platform = platforms.firstWhere((p) => p.id == platformId);
                  return Tooltip(
                    message: platform.label,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: IconNormalizedWidget(
                        icon: platform.icon,
                        color: Colors.black26,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          Text(
            DateFormat(UIConfig.projectDateFormat).format(date),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          verticalSpaceSmall,
          Row(
            children: [
              Expanded(
                child:
                    // BUG: If max-width is set, this will overflow no matter what
                    // This at least makes it scrollable. This is most likely fixed in
                    // a future Flutter update. Once max-width works out of the box, remove this.
                    // #495b783568
                    MarkdownWrapperWidget(
                  data: widget.project.description,
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
          Wrap(
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            runSpacing: kHorizontalSpaceSmall,
            children: [
              Wrap(
                spacing: kHorizontalSpaceSmall,
                runSpacing: kHorizontalSpaceSmall,
                children: widget.project.tags
                    .map(
                      (tagId) => ChipWidget(tagId: tagId),
                    )
                    .toList(),
              ),
              horizontalSpaceSmall,
              Wrap(
                spacing: kHorizontalSpaceSmall,
                runSpacing: kHorizontalSpaceSmall,
                children: listActions,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
