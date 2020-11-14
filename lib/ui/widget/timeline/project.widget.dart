import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/config/projects.config.dart';
import 'package:portfolio/models/colors.model.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/timeline/button.widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({Key key, this.project}) : super(key: key);

  final ProjectData project;

  bool get hasDemo => (project.urlDemo ?? "").isNotEmpty;
  bool get hasDownload => (project.urlDownload ?? "").isNotEmpty;
  bool get hasGithub => (project.githubName ?? "").isNotEmpty;
  bool get hasPlaystore => (project.urlPlaystore ?? "").isNotEmpty;
  bool get hasWebsite => (project.urlWebsite ?? "").isNotEmpty;

  @override
  Widget build(BuildContext context) {
    dynamic colors = Provider.of<ColorModel>(context).colors;
    assert(colors != null);

    List listChips = (project.tags.map(
      (t) {
        Color colorBg = getColorFromColorCode(t.colorHex);
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

    List listActions = [
      hasDemo
          ? ButtonWidget(
              label: "Demo",
              url: project.urlDemo,
            )
          : null,
      hasDownload
          ? ButtonWidget(
              icon: Icons.file_download,
              label: "Download",
              url: project.urlDownload,
            )
          : null,
      hasPlaystore
          ? ButtonWidget(
              icon: Icons.open_in_new,
              isIconTrailing: true,
              label: "Play Store",
              url: project.urlPlaystore,
            )
          : null,
      hasGithub
          ? ButtonWidget(
              icon: Icons.open_in_new,
              isIconTrailing: true,
              label: "Github",
              color: Color(0xFF333333),
              url: "https://github.com/CiriousJoker/${project.githubName}",
            )
          : null,
      hasWebsite
          ? ButtonWidget(
              icon: Icons.open_in_new,
              isIconTrailing: true,
              label: "Website",
              url: project.urlWebsite,
            )
          : null,
    ].where((element) => element != null).toList();

    DateTime date = DateTime.fromMillisecondsSinceEpoch(project.timestamp);

    return Card(
      color: Colors.white,
      child: Stack(
        // alignment: ,
        children: [
          // (project.platforms ?? []).length > 0
          //     ? Align(
          //         alignment: Alignment.topRight,
          //         heightFactor: 1,
          //         child: Padding(
          //           padding: EdgeInsets.all(8.0),
          //           child: ,
          //         )
          //         //
          //         ,
          //       )
          //     : SizedBox.shrink(),
          Container(
            padding: EdgeInsets.only(
              left: UIHelper.VerticalSpaceMedium,
              right: UIHelper.VerticalSpaceMedium,
              top: UIHelper.VerticalSpaceMedium,
              bottom: UIHelper.VerticalSpaceMedium,
            ),
            constraints: BoxConstraints(maxWidth: 512),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      project.title,
                      style: Theme.of(context).textTheme.headline5,
                      // textAlign: TextAlign.start,
                    ),
                    Spacer(),
                    ...(project?.platforms ?? [])
                        .map((e) => Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Icon(
                                e,
                                size: e.fontFamily == "MaterialIcons" ? 20 : 16,
                                color: Colors.black26,
                              ),
                            ))
                        .toList(),
                    // Container(
                    //   decoration: BoxDecoration(
                    //     shape: BoxShape.circle,
                    //   ),
                    //   clipBehavior: Clip.antiAlias,
                    //   child: Image.network(
                    //     "https://play-lh.googleusercontent.com/aEoUb80IVMui5g9xqi3BZBUUKxkPZLzFbHqoK8GgJVNqdYFibqA9QpVi0unZcmK573wD=s360-rw",
                    //     height: 32,
                    //     width: 32,
                    //   ),
                    // ),
                  ],
                ),
                Text(
                  DateFormat("MMM y").format(date),
                  style: Theme.of(context).textTheme.caption,
                  // textAlign: TextAlign.start,
                ),
                UIHelper.verticalSpaceSmall(),
                MarkdownBody(
                  data: project.description,
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
          ),
        ],
      ),
    );
  }
}

// https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter
Color getColorFromColorCode(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}
