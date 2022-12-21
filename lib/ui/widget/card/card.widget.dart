// ignore_for_file: use_super_parameters

import "dart:math";

import "package:flutter/material.dart";
import "package:portfolio/config/colors.config.dart";
import "package:portfolio/config/general.config.dart";
import "package:portfolio/config/ui.config.dart";
import "package:portfolio/fonts/material_icons_minified_icons.dart";
import "package:portfolio/ui/helper/ui.helper.dart";
import "package:portfolio/ui/widget/card/avatar.widget.dart";
import "package:portfolio/ui/widget/util/markdown_wrapper.widget.dart";
import "package:slimy_card/slimy_card.dart";
import "package:url_launcher/url_launcher_string.dart";

class CardWidget extends StatefulWidget {
  const CardWidget({Key? key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  static const Icon iconQuotationmark = Icon(
    MaterialIconsMinified.format_quote_close,
    color: ColorsConfig.cardTextQuotationmarks,
    size: UIConfig.cardQuotationmarkSize,
  );

  @override
  Widget build(BuildContext context) {
    const double padding = kHorizontalSpaceMedium;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SlimyCard(
          icon: const Icon(
            MaterialIconsMinified.chevron_down,
            color: Colors.black87,
          ),
          color: ColorsConfig.card,
          width: min(constraints.maxWidth, UIConfig.cardMaxWidth),
          topCardHeight: UIConfig.cardSizeTop,
          bottomCardHeight: UIConfig.cardSizeBottom,
          borderRadius: UIConfig.cardRadius,
          topCardWidget: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: padding).copyWith(
                    top: padding,
                  ),
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.bottomLeft,
                        child: iconQuotationmark,
                      ),
                      Align(
                        child: Text(
                          GeneralConfig.quote,
                          style: UIConfig.cardQuoteTextStyle.copyWith(
                            color: ColorsConfig.cardText,
                            fontFamily: "Exo2",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: iconQuotationmark,
                      ),
                    ],
                  ),
                ),
              ),
              verticalSpaceSmall,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            GeneralConfig.name,
                            style: Theme.of(context).textTheme.headline4?.copyWith(
                                  color: ColorsConfig.cardText,
                                  fontWeight: FontWeight.w200,
                                  fontFamily: "Catamaran",
                                ),
                            textAlign: TextAlign.center,
                          ),
                          verticalSpaceSmall,
                          const SizedBox(
                            width: 48,
                            child: Divider(
                              color: ColorsConfig.cardTextSecondary,
                            ),
                          ),
                          verticalSpaceSmall,
                          Text(
                            GeneralConfig.position,
                            style: Theme.of(context).textTheme.caption?.copyWith(
                                  color: ColorsConfig.cardTextSecondary,
                                ),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: AvatarWidget(
                        height: UIConfig.cardSizeAvatar,
                        width: UIConfig.cardSizeAvatar,
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpaceSmall,
              verticalSpace(padding),
            ],
          ),
          bottomCardWidget: Padding(
            padding: const EdgeInsets.all(kHorizontalSpaceMedium),
            child: Stack(
              children: [
                SingleChildScrollView(
                  // Necessary as per:
                  // https://github.com/flutter/flutter/issues/85456
                  controller: ScrollController(),
                  child: const MarkdownWrapperWidget(
                    data: GeneralConfig.aboutMe,
                    style: TextStyle(
                      fontSize: 17,
                      color: ColorsConfig.cardText,
                      fontWeight: FontWeight.w200,
                      height: 1.4,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: Text(
                      GeneralConfig.myersBriggs,
                      style: Theme.of(context).textTheme.caption?.copyWith(
                            color: ColorsConfig.cardTextSecondary,
                          ),
                    ),
                    onTap: () {
                      if (GeneralConfig.myersBriggsUrl != null) {
                        try {
                          launchUrlString(GeneralConfig.myersBriggsUrl!);
                        } catch (e) {
                          assert(false);
                        }
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
