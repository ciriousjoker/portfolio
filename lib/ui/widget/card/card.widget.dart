import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/config/general.config.dart';
import 'package:portfolio/config/colors.config.dart';
import 'package:portfolio/config/ui.config.dart';
import 'package:portfolio/fonts/material_icons_minified_icons.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/card/avatar.widget.dart';
import 'package:portfolio/ui/widget/util/markdown_wrapper.widget.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key? key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  static const Icon iconQuotationmark = const Icon(
    MaterialIconsMinified.format_quote_close,
    color: ColorsConfig.cardTextQuotationmarks,
    size: UIConfig.cardQuotationmarkSize,
  );

  @override
  Widget build(BuildContext context) {
    const double padding = UIHelper.HorizontalSpaceMedium;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SlimyCard(
          icon: Icon(
            MaterialIconsMinified.chevron_down,
            color: Colors.black87,
          ),
          color: ColorsConfig.card,
          width: min(constraints.maxWidth, UIConfig.cardMaxWidth),
          topCardHeight: UIConfig.cardSizeTop,
          bottomCardHeight: UIConfig.cardSizeBottom,
          borderRadius: UIConfig.cardRadius,
          topCardWidget: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding)
                        .copyWith(
                      top: padding,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: iconQuotationmark,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            GeneralConfig.quote,
                            style: UIConfig.cardQuoteTextStyle.copyWith(
                              color: ColorsConfig.cardText,
                              fontFamily: "Exo2",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: iconQuotationmark,
                        ),
                      ],
                    ),
                  ),
                ),
                UIHelper.verticalSpaceSmall(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              GeneralConfig.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4
                                  ?.copyWith(
                                    color: ColorsConfig.cardText,
                                    fontWeight: FontWeight.w200,
                                    fontFamily: "Catamaran",
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            UIHelper.verticalSpaceSmall(),
                            SizedBox(
                              width: 48,
                              child: Divider(
                                color: ColorsConfig.cardTextSecondary,
                              ),
                            ),
                            UIHelper.verticalSpaceSmall(),
                            Text(
                              GeneralConfig.position,
                              style:
                                  Theme.of(context).textTheme.caption?.copyWith(
                                        color: ColorsConfig.cardTextSecondary,
                                      ),
                              maxLines: 3,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AvatarWidget(
                          height: UIConfig.cardSizeAvatar,
                          width: UIConfig.cardSizeAvatar,
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpaceSmall(),
                UIHelper.verticalSpace(padding),
              ],
            ),
          ),
          bottomCardWidget: Padding(
            padding: const EdgeInsets.all(UIHelper.HorizontalSpaceMedium),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: MarkdownWrapperWidget(
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
                          launch(GeneralConfig.myersBriggsUrl!);
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
          slimeEnabled: true,
        );
      },
    );
  }
}
