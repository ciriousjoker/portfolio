import 'package:flutter/material.dart';
import 'package:portfolio/fonts/brand_icons_minified_icons.dart';
import 'package:portfolio/config/general.config.dart';
import 'package:portfolio/config/colors.config.dart';
import 'package:portfolio/fonts/material_icons_minified_icons.dart';
import 'package:portfolio/ui/widget/util/icon_normalized.widget.dart';
import 'package:portfolio/ui/widget/util/rounded_border.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AvatarWidget extends StatelessWidget {
  static const double sizeAction = 38;

  const AvatarWidget({
    Key key,
    this.color = ColorsConfig.card,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width + 0.5 * sizeAction,
      height: height + 0.5 * sizeAction,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(GeneralConfig.assetAvatar),
          ),
          Transform.translate(
            offset: Offset(
              (0.5 * width) - (0.5 * sizeAction),
              (height) - (0.5 * sizeAction),
            ),
            child: _Action(
              size: sizeAction,
              icon: MaterialIconsMinified.email,
              onTap: () {
                try {
                  launch("mailto:${GeneralConfig.email}");
                } catch (e) {
                  assert(false);
                }
              },
            ),
          ),
          Transform.translate(
            offset: Offset(
              (width) - (1 * sizeAction),
              (height) - (1 * sizeAction),
            ),
            child: _Action(
              size: sizeAction,
              icon: BrandIconsMinified.linkedin,
              onTap: () {
                try {
                  launch(GeneralConfig.linkedin);
                } catch (e) {
                  assert(false);
                }
              },
            ),
          ),
          Transform.translate(
            offset: Offset(
              (width) - (0.5 * sizeAction),
              (0.5 * height) - (0.5 * sizeAction),
            ),
            child: _Action(
              size: sizeAction,
              icon: BrandIconsMinified.github,
              onTap: () {
                try {
                  launch(GeneralConfig.githubUrl);
                } catch (e) {
                  assert(false);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Action extends StatelessWidget {
  static const double borderWidth = 4;
  static const double sizeIcon = 18;
  static const Color colorFab = Colors.white;
  static const Color colorIcon = Colors.black87;

  const _Action({
    Key key,
    this.alignment,
    @required this.icon,

    /// Total size of this widget
    @required this.size,

    /// Color behind the action
    this.colorBackground = ColorsConfig.card,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Alignment alignment;
  final Function onTap;
  final Color colorBackground;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: InkWell(
        child: RoundedBorderWidget(
          color: colorBackground,
          size: borderWidth,
          elevation: 4,
          child: Container(
            color: colorFab,
            child: Padding(
              padding: EdgeInsets.all(borderWidth),
              child: Center(
                child: IconNormalizedWidget(
                  icon: icon,
                  size: sizeIcon,
                  color: colorIcon,
                ),
              ),
            ),
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
