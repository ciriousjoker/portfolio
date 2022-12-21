import "package:flutter/material.dart";
import "package:portfolio/config/colors.config.dart";
import "package:portfolio/config/general.config.dart";
import "package:portfolio/fonts/brand_icons_minified_icons.dart";
import "package:portfolio/fonts/material_icons_minified_icons.dart";
import "package:portfolio/ui/widget/util/icon_normalized.widget.dart";
import "package:portfolio/ui/widget/util/rounded_border.widget.dart";
import "package:url_launcher/url_launcher.dart";
import "package:url_launcher/url_launcher_string.dart";

class AvatarWidget extends StatelessWidget {
  static const double sizeAction = 38;

  const AvatarWidget({
    super.key,
    this.color = ColorsConfig.card,
    required this.width,
    required this.height,
  });

  final Color color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width + 0.5 * sizeAction,
      height: height + 0.5 * sizeAction,
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              GeneralConfig.assetAvatar,
              isAntiAlias: true,
              filterQuality: FilterQuality.high,
            ),
          ),
          Transform.translate(
            offset: Offset(
              (0.5 * width) - (0.5 * sizeAction),
              height - (0.5 * sizeAction),
            ),
            child: _Action(
              size: sizeAction,
              icon: MaterialIconsMinified.email,
              tooltip: "Email",
              onTap: () {
                try {
                  launchUrl(
                    Uri(
                      scheme: "mailto",
                      path: GeneralConfig.email,
                      queryParameters: {"body": "Hey,\n"},
                    ),
                  );
                } catch (e) {
                  assert(false);
                }
              },
            ),
          ),
          Transform.translate(
            offset: Offset(
              width - (1 * sizeAction),
              height - (1 * sizeAction),
            ),
            child: _Action(
              size: sizeAction,
              icon: BrandIconsMinified.linkedin,
              tooltip: "LinkedIn",
              onTap: () {
                try {
                  launchUrlString(GeneralConfig.linkedin);
                } catch (e) {
                  assert(false);
                }
              },
            ),
          ),
          Transform.translate(
            offset: Offset(
              width - (0.5 * sizeAction),
              (0.5 * height) - (0.5 * sizeAction),
            ),
            child: _Action(
              size: sizeAction,
              icon: BrandIconsMinified.github,
              tooltip: "Github",
              onTap: () {
                try {
                  launchUrlString(GeneralConfig.githubUrl);
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
  static const Color colorBackground = ColorsConfig.card;

  const _Action({
    required this.icon,

    /// Total size of this widget
    required this.size,
    this.tooltip = "",
    required this.onTap,
  });

  final IconData icon;
  final void Function() onTap;
  final double size;
  final String tooltip;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: InkWell(
        onTap: onTap,
        child: RoundedBorderWidget(
          color: colorBackground,
          size: borderWidth,
          elevation: 4,
          child: Tooltip(
            message: tooltip,
            child: ColoredBox(
              color: colorFab,
              child: Padding(
                padding: const EdgeInsets.all(borderWidth),
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
        ),
      ),
    );
  }
}
