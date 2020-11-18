import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/icon_normalized.widget.dart';
import 'package:portfolio/ui/widget/timeline/button.widget.dart';
import 'package:portfolio/ui/widget/timeline/project/project_card.widget.dart';
import 'package:markdown_widget/markdown_widget.dart';

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
  List<Widget> listChips;
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

    listChips = (widget.project.tags.map(
      (t) {
        Color colorBg = UIHelper.getColorFromColorCode(t.colorHex);
        Color colorText =
            colorBg.computeLuminance() > 0.5 ? Colors.black : Colors.white;

        return Chip(
          backgroundColor: colorBg,
          label: Text(
            t.label,
            style: TextStyle(
              color: colorText,
              height: 1,
            ),
          ),
          labelPadding: EdgeInsets.only(left: 4, right: 8),
          visualDensity: VisualDensity.compact,
          avatar: Icon(
            t.icon,
            size: 16,
            color: colorText,
          ),
        );
      },
    ).toList());

    listActions = [
      hasDemo
          ? ButtonWidget(
              label: "Demo",
              url: widget.project.urlDemo,
            )
          : null,
      hasDownload
          ? ButtonWidget(
              icon: Icons.file_download,
              label: "Download",
              url: widget.project.urlDownload,
            )
          : null,
      hasPlaystore
          ? ButtonWidget(
              icon: Icons.open_in_new,
              isIconTrailing: true,
              label: "Play Store",
              url: widget.project.urlPlaystore,
            )
          : null,
      hasGithub
          ? ButtonWidget(
              icon: Icons.open_in_new,
              isIconTrailing: true,
              label: "Github",
              color: Color(0xFF333333),
              url:
                  "https://github.com/CiriousJoker/${widget.project.githubName}",
            )
          : null,
      hasWebsite
          ? ButtonWidget(
              icon: Icons.open_in_new,
              isIconTrailing: true,
              label: "Website",
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
            DateFormat("MMM y").format(date),
            style: Theme.of(context).textTheme.caption,
          ),
          UIHelper.verticalSpaceSmall(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: MarkdownGenerator(
                    data: widget.project.description,
                    styleConfig: StyleConfig(
                      pConfig: PConfig(
                        textStyle: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                  ).widgets,
                ),
              ),
              UIHelper.horizontalSpaceSmall(),
              Container(
                width: 1,
                // TODO: Parameter
                height: 64,
                color: Colors.black12,
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
            runSpacing: 8.0,
            children: [
              Wrap(
                spacing: 8.0,
                runSpacing: 8,
                children: listChips,
              ),
              UIHelper.horizontalSpaceSmall(),
              Wrap(
                spacing: 8.0,
                runSpacing: 8,
                children: listActions,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
