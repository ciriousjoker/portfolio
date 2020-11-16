import 'package:flutter/material.dart';
import 'package:portfolio/brand_icons/brand_icons_icons.dart';
import 'package:portfolio/config/colors.config.dart';
import 'package:portfolio/ui/widget/icon_normalized.widget.dart';
import 'package:portfolio/ui/widget/rounded_border.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key key,
    this.color = ColorsConfig.card,
    @required this.width,
    @required this.height,
  }) : super(key: key);

  final Color color;
  final double sizeAction = 32;
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
            child: Image.asset("assets/images/avatar.jpg"),
          ),
          Transform.translate(
            offset: Offset(
              (0.5 * width) - (0.5 * sizeAction),
              (height) - (0.5 * sizeAction),
            ),
            child: _Action(
              size: sizeAction,
              icon: Icons.email,
              onTap: () {
                try {
                  launch("mailto:ciriousjoker@gmail.com");
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
              icon: BrandIcons.linkedin,
              onTap: () {
                try {
                  launch("TODO: Linkedin");
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
              icon: BrandIcons.github,
              onTap: () {
                try {
                  launch("http://github.com/CiriousJoker/");
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
  const _Action({
    Key key,
    this.alignment,
    @required this.icon,
    this.color = ColorsConfig.card,
    @required this.size,
    this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Alignment alignment;
  final Function onTap;
  final Color color;
  final double size;

  final double borderWidth = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      child: RoundedBorderWidget(
        color: color,
        size: borderWidth,
        elevation: 4,
        child: InkWell(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.all(borderWidth),
              child: Center(
                child: IconNormalizedWidget(
                  icon: icon,
                  size: 16,
                ),
              ),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
