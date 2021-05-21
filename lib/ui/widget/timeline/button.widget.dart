import 'package:flutter/material.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.label,
    required this.url,
    this.isIconTrailing = false,
    this.icon,
    required this.tooltip,
    this.color,
  }) : super(key: key);

  final String label;
  final String url;
  final String tooltip;
  final bool isIconTrailing;
  final IconData? icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final colorBg = color ?? Theme.of(context).accentColor;
    final colorText =
        colorBg.computeLuminance() > 0.5 ? Colors.black87 : Colors.white;

    var widgetIcon = Icon(
      icon,
      size: 12,
      color: colorText,
    );

    var widgetText = Text(
      label,
    );

    if (icon == null) {
      return Tooltip(
        message: tooltip,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: colorBg,
            onPrimary: colorText,
            padding: EdgeInsets.symmetric(
              vertical: UIHelper.VerticalSpaceMedium,
              horizontal: 20,
            ),
          ),
          child: widgetText,
          onPressed: () async {
            await launch(url);
          },
        ),
      );
    }

    return Tooltip(
      message: tooltip,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          onPrimary: colorText,
          primary: colorBg,
          padding: EdgeInsets.symmetric(
            vertical: UIHelper.VerticalSpaceMedium,
            horizontal: 20,
          ),
        ),
        icon: isIconTrailing ? widgetText : widgetIcon,
        label: isIconTrailing ? widgetIcon : widgetText,
        onPressed: () async {
          await launch(url);
        },
      ),
    );
  }
}
