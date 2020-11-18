import 'package:flutter/material.dart';

class UIHelper {
  // Vertical spacing constants. Adjust to your liking.
  static const double VerticalSpaceSmall = 8.0;
  static const double VerticalSpaceMedium = 16.0;
  static const double VerticalSpaceLarge = 32.0;

  // Vertical spacing constants. Adjust to your liking.
  static const double HorizontalSpaceSmall = 8.0;
  static const double HorizontalSpaceMedium = 16.0;
  static const double HorizontalSpaceLarge = 32.0;

  /// Returns a vertical space with height set to [VerticalSpaceSmall]
  static Widget verticalSpaceSmall() {
    return verticalSpace(VerticalSpaceSmall);
  }

  /// Returns a vertical space with height set to [VerticalSpaceMedium]
  static Widget verticalSpaceMedium() {
    return verticalSpace(VerticalSpaceMedium);
  }

  /// Returns a vertical space with height set to [VerticalSpaceLarge]
  static Widget verticalSpaceLarge() {
    return verticalSpace(VerticalSpaceLarge);
  }

  /// Returns a vertical space equal to the [height] supplied
  static Widget verticalSpace(double height) {
    return Container(height: height, width: 0);
  }

  /// Returns a vertical space with height set to [HorizontalSpaceSmall]
  static Widget horizontalSpaceSmall() {
    return horizontalSpace(HorizontalSpaceSmall);
  }

  /// Returns a vertical space with height set to [HorizontalSpaceMedium]
  static Widget horizontalSpaceMedium() {
    return horizontalSpace(HorizontalSpaceMedium);
  }

  /// Returns a vertical space with height set to [HorizontalSpaceLarge]
  static Widget horizontalSpaceLarge() {
    return horizontalSpace(HorizontalSpaceLarge);
  }

  /// Returns a vertical space equal to the [width] supplied
  static Widget horizontalSpace(double width) {
    return Container(width: width, height: 0);
  }

  // https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter
  static Color getColorFromColorCode(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }
}
