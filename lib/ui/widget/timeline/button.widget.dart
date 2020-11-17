import 'package:flutter/material.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key key,
    this.label,
    this.url,
    this.isIconTrailing = false,
    this.icon,
    this.color,
  }) : super(key: key);

  final String label;
  final String url;
  final bool isIconTrailing;
  final IconData icon;
  final Color color;

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
      return RaisedButton(
        color: colorBg,
        padding: EdgeInsets.symmetric(
          vertical: UIHelper.VerticalSpaceMedium,
          horizontal: 20,
        ),
        textColor: colorText,
        child: widgetText,
        onPressed: () async {
          await launch(url);
        },
      );
    }

    return RaisedButton.icon(
      color: colorBg,
      padding: EdgeInsets.symmetric(
        vertical: UIHelper.VerticalSpaceMedium,
        horizontal: 20,
      ),
      icon: isIconTrailing ? widgetText : widgetIcon,
      label: isIconTrailing ? widgetIcon : widgetText,
      textColor: colorText,
      onPressed: () async {
        await launch(url);
      },
    );
  }
}
