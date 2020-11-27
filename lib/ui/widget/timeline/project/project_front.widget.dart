import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/config/colors.config.dart';
import 'package:portfolio/config/general.config.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/config/ui.config.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/util/chip.widget.dart';
import 'package:portfolio/ui/widget/util/icon_normalized.widget.dart';
import 'package:portfolio/ui/widget/timeline/button.widget.dart';
import 'package:portfolio/ui/widget/timeline/project/project_card.widget.dart';
import 'package:portfolio/ui/widget/util/markdown_wrapper.widget.dart';

class ProjectFrontWidget extends StatefulWidget {
  final ProjectData project;
  final Widget flipHint;

  const ProjectFrontWidget({
    Key key,
    @required this.project,
    this.flipHint,
  }) : super(key: key);

  @override
  _ProjectFrontWidgetState createState() => _ProjectFrontWidgetState();
}

class _ProjectFrontWidgetState extends State<ProjectFrontWidget> {
  DateTime date;
  List<Widget> listActions;

  bool get hasDemo => (widget.project.urlDemo ?? "").isNotEmpty;
  bool get hasDownload => (widget.project.urlDownload ?? "").isNotEmpty;
  bool get hasGithub => (widget.project.githubName ?? "").isNotEmpty;
  bool get hasPlaystore => (widget.project.urlPlaystore ?? "").isNotEmpty;
  bool get hasWebsite => (widget.project.urlWebsite ?? "").isNotEmpty;

  @override
  void initState() {
    super.initState();
    date = DateTime.fromMillisecondsSinceEpoch(widget.project.timestamp);

    listActions = [
      hasDemo
          ? ButtonWidget(
              label: "Demo",
              tooltip: "Try a demo on your browser",
              url: widget.project.urlDemo,
            )
          : null,
      hasDownload
          ? ButtonWidget(
              icon: Icons.file_download,
              label: "Download",
              tooltip: "Download the latest release",
              url: widget.project.urlDownload,
            )
          : null,
      hasPlaystore
          ? ButtonWidget(
              icon: Icons.open_in_new,
              isIconTrailing: true,
              label: "Play Store",
              tooltip: "Available in the Play Store",
              url: widget.project.urlPlaystore,
            )
          : null,
      hasGithub
          ? ButtonWidget(
              icon: Icons.open_in_new,
              isIconTrailing: true,
              label: "Github",
              tooltip: "View the source code",
              // Github brand color
              color: Color(0xFF333333),
              url:
                  "https://github.com/${GeneralConfig.github}/${widget.project.githubName}",
            )
          : null,
      hasWebsite
          ? ButtonWidget(
              icon: Icons.open_in_new,
              isIconTrailing: true,
              label: "Website",
              tooltip: "This project has a website",
              url: widget.project.urlWebsite,
            )
          : null,
    ].where((element) => element != null).toList();
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
                  style: Theme.of(context).textTheme.headline5,
                  maxLines: 3,
                ),
              ),
              ...(widget.project?.platforms ?? [])
                  .map((iconData) => Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: IconNormalizedWidget(
                          icon: iconData,
                          color: Colors.black26,
                        ),
                      ))
                  .toList(),
            ],
          ),
          Text(
            DateFormat(UIConfig.projectDateFormat).format(date),
            style: Theme.of(context).textTheme.caption,
          ),
          UIHelper.verticalSpaceSmall(),
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
          Wrap(
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.spaceBetween,
            runSpacing: UIHelper.HorizontalSpaceSmall,
            children: [
              Wrap(
                spacing: UIHelper.HorizontalSpaceSmall,
                runSpacing: UIHelper.HorizontalSpaceSmall,
                children: widget.project.tags
                    .map(
                      (t) => ChipWidget(tag: t),
                    )
                    .toList(),
              ),
              UIHelper.horizontalSpaceSmall(),
              Wrap(
                spacing: UIHelper.HorizontalSpaceSmall,
                runSpacing: UIHelper.HorizontalSpaceSmall,
                children: listActions,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
