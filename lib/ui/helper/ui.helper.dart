import "package:flutter/material.dart";
import "package:get/get.dart";

// Vertical spacing constants. Adjust to your liking.
const double kVerticalSpaceSmall = 8.0;
const double kVerticalSpaceMedium = 16.0;
const double kVerticalSpaceLarge = 32.0;

// Vertical spacing constants. Adjust to your liking.
const double kHorizontalSpaceSmall = 8.0;
const double kHorizontalSpaceMedium = 16.0;
const double kHorizontalSpaceLarge = 32.0;

/// Returns a vertical space with height set to [kVerticalSpaceSmall]
Widget verticalSpaceSmall() {
  return verticalSpace(kVerticalSpaceSmall);
}

/// Returns a vertical space with height set to [kVerticalSpaceMedium]
Widget verticalSpaceMedium() {
  return verticalSpace(kVerticalSpaceMedium);
}

/// Returns a vertical space with height set to [kVerticalSpaceLarge]
Widget verticalSpaceLarge() {
  return verticalSpace(kVerticalSpaceLarge);
}

/// Returns a vertical space equal to the [height] supplied
Widget verticalSpace(double height) {
  return SizedBox(height: height, width: 0);
}

/// Returns a vertical space with height set to [kHorizontalSpaceSmall]
Widget horizontalSpaceSmall() {
  return horizontalSpace(kHorizontalSpaceSmall);
}

/// Returns a vertical space with height set to [kHorizontalSpaceMedium]
Widget horizontalSpaceMedium() {
  return horizontalSpace(kHorizontalSpaceMedium);
}

/// Returns a vertical space with height set to [kHorizontalSpaceLarge]
Widget horizontalSpaceLarge() {
  return horizontalSpace(kHorizontalSpaceLarge);
}

/// Returns a vertical space equal to the [width] supplied
Widget horizontalSpace(double width) {
  return SizedBox(width: width, height: 0);
}

// https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter
Color getColorFromColorCode(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

bool isVertical(BuildContext context) {
  return context.isPortrait || context.width < 1280;
}

extension WidgetExtension on Widget {
  bool isDense(BuildContext context) {
    return isVertical(context) || context.width < 1600;
  }
}
