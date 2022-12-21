import "package:flutter/material.dart";
import "package:portfolio/ui/helper/ui.helper.dart";
import "package:url_launcher/url_launcher_string.dart";

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
    final colorBg = color ?? Theme.of(context).colorScheme.secondary;
    final colorText = colorBg.computeLuminance() > 0.5 ? Colors.black87 : Colors.white;

    final widgetIcon = Icon(
      icon,
      size: 12,
      color: colorText,
    );

    final widgetText = Text(
      label,
    );

    if (icon == null) {
      return Tooltip(
        message: tooltip,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorBg,
            foregroundColor: colorText,
            padding: const EdgeInsets.symmetric(
              vertical: kVerticalSpaceMedium,
              horizontal: 20,
            ),
          ),
          child: widgetText,
          onPressed: () async {
            await launchUrlString(url);
          },
        ),
      );
    }

    return Tooltip(
      message: tooltip,
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          foregroundColor: colorText,
          backgroundColor: colorBg,
          padding: const EdgeInsets.symmetric(
            vertical: kVerticalSpaceMedium,
            horizontal: 20,
          ),
        ),
        icon: isIconTrailing ? widgetText : widgetIcon,
        label: isIconTrailing ? widgetIcon : widgetText,
        onPressed: () async {
          await launchUrlString(url);
        },
      ),
    );
  }
}
