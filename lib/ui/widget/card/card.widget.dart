import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:portfolio/config/colors.config.dart';
import 'package:portfolio/config/general.config.dart';
import 'package:portfolio/ui/helper/ui.helper.dart';
import 'package:portfolio/ui/widget/card/avatar.widget.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:url_launcher/url_launcher.dart';

class CardWidget extends StatefulWidget {
  CardWidget({Key key}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    final Icon quotationMark = Icon(
      Icons.format_quote_sharp,
      color: ColorsConfig.cardText.withOpacity(0.38),
      size: 20,
    );

    const double padding = UIHelper.HorizontalSpaceMedium;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SlimyCard(
          color: ColorsConfig.card,
          width: min(constraints.maxWidth, 384),
          topCardHeight: 268,
          bottomCardHeight: 312,
          borderRadius: 24,
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
                          child: quotationMark,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            GeneralConfig.quote,
                            style: GoogleFonts.exo2(
                              textStyle: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w300,
                                color: ColorsConfig.cardText,
                              ),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 10,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: quotationMark,
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
                                  .copyWith(
                                    color: ColorsConfig.cardText,
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
                                  Theme.of(context).textTheme.caption.copyWith(
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
                          height: 128,
                          width: 128,
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
                MarkdownWidget(
                  data: GeneralConfig.aboutMe,
                  styleConfig: StyleConfig(
                    pConfig: PConfig(
                      textStyle: TextStyle(
                        fontSize: 17,
                        color: ColorsConfig.cardText,
                        fontWeight: FontWeight.w300,
                        height: 1.25,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: Text(
                      "ISTJ-A",
                      style: Theme.of(context).textTheme.caption.copyWith(
                            color: ColorsConfig.cardTextSecondary,
                          ),
                    ),
                    onTap: () {
                      try {
                        launch("https://example.com");
                      } catch (e) {
                        assert(false);
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
