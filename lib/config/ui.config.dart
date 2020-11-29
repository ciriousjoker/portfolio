import 'package:flutter/material.dart';

class UIConfig {
  // Timeline
  static const double timelineLineThickness = 2.5;
  static const double timelineIndicatorSize = 64;
  static const double timelineProjectSpacing = 24;
  static const double timelineGlowBlurRadius = 6;

  // Card
  static const double cardQuotationmarkSize = 20;
  static const double cardRadius = 24;
  static const double cardMaxWidth = 384;
  static const double cardSizeTop = 268;
  static const double cardSizeBottom = 320;
  static const double cardSizeAvatar = 128;
  static const TextStyle cardQuoteTextStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w300,
  );

  // Project
  static const double projectRadius = 16;
  static const String projectHeadline = "Learnings";
  static const double projectDividerHeight = 64;
  static const double projectGlowBlurRadius = 6;
  static const double projectMaxWidth = 512;
  static const String projectDateFormat = "MMM y";
  static const Duration projectFlipDuration = Duration(milliseconds: 750);
  static const Duration projectHintDelay = Duration(seconds: 2);
  static const Duration projectFlipHintDuration = Duration(milliseconds: 300);
  static const Duration projectFlipHintTotal = Duration(milliseconds: 3500);
}
