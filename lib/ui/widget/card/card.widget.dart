import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio/config/colors.config.dart';
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return SlimyCard(
          color: ColorsConfig.card,
          width: min(constraints.maxWidth, 384),
          topCardHeight: 270,
          bottomCardHeight: 290,
          borderRadius: 24,
          topCardWidget: Padding(
            padding: const EdgeInsets.all(UIHelper.HorizontalSpaceMedium),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Icon(
                          Icons.format_quote,
                          color: ColorsConfig.cardText,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Code is written for humans,\nnot machines.",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w200,
                            color: ColorsConfig.cardText,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 10,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.format_quote,
                          color: ColorsConfig.cardText,
                        ),
                      ),
                    ],
                  ),
                ),
                UIHelper.verticalSpaceSmall(),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Philipp Bauer",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.w200,
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
                            "‚Computer Science and Media’ student at Technische Hochschule Nuremberg",
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  fontSize: 11,
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
              ],
            ),
          ),
          bottomCardWidget: Padding(
            padding: const EdgeInsets.all(UIHelper.HorizontalSpaceMedium),
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      MarkdownBody(
                        data: """
I develop websites, apps and sometimes random things that spark my interest :)\n\n
I have tried lots of languages and frameworks over the years. Right now, I like a combination of Flutter, Typescript, and Firebase the most.
As you can guess by the quote above, I value code quality very highly, but a great UI/UX is also a requirement for everything I do.\n
\n
Don't take my word for it, feel free to check our the projects yourself.\n\n

Have a great day!
""",
                        styleSheet: MarkdownStyleSheet(
                          p: TextStyle(
                            fontSize: 17,
                            color: ColorsConfig.cardText,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    child: Text(
                      "ISTJ-A",
                      style: TextStyle(
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
