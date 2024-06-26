import "package:flutter/material.dart";
import "package:portfolio/config/colors.config.dart";
import "package:portfolio/config/ui.config.dart";
import "package:portfolio/ui/helper/ui.helper.dart";

class ProjectCardWidget extends StatelessWidget {
  final Widget child;

  const ProjectCardWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(UIConfig.projectGlowBlurRadius + 1),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UIConfig.projectRadius),
          boxShadow: const [
            BoxShadow(
              color: ColorsConfig.projectGlow,
              blurRadius: UIConfig.projectGlowBlurRadius,
            ),
          ],
        ),
        // BUG: This can't be enabled without causing #495b783568
        // Try enabling this in future Flutter versions if the UI is preferred.
        // constraints: BoxConstraints(maxWidth: UIConfig.projectMaxWidth),
        child: Material(
          color: ColorsConfig.projectCard,
          child: Container(
            padding: const EdgeInsets.all(
              kVerticalSpaceMedium,
            ).copyWith(
              top: kVerticalSpaceSmall,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
