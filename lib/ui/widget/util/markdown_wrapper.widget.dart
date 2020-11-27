import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:portfolio/config/colors.config.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownWrapperWidget extends StatelessWidget {
  final String data;
  final TextStyle style;

  const MarkdownWrapperWidget({
    Key key,
    this.data = "",
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final styleP = style ?? Theme.of(context).textTheme.bodyText2;

    return MarkdownBody(
      data: data,
      builders: {
        // Handle links separately:
        // https://github.com/flutter/flutter_markdown/issues/233
        "a": LinkBuilder(),
      },
      styleSheet: MarkdownStyleSheet(
        p: styleP,
        h3: Theme.of(context).textTheme.bodyText2.copyWith(
              fontSize: 19,
            ),
        h4: Theme.of(context).textTheme.bodyText2.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
        strong: TextStyle(
          fontWeight: FontWeight.w600,
        ),
        horizontalRuleDecoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorsConfig.projectDivider, width: 1),
          ),
        ),
        em: TextStyle(
          color: styleP.color.withOpacity(0.5),
        ),
        blockquote: TextStyle(
          color: styleP.color.withOpacity(0.6),
        ),
        blockquoteDecoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          border: Border(
            left: BorderSide(
              color: ColorsConfig.primary,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class LinkBuilder extends MarkdownElementBuilder {
  @override
  Widget visitElementAfter(
    md.Element element,
    TextStyle style,
  ) {
    return Transform.translate(
      // Fix a weird alignment issue. Might be fixed by Flutter in the future
      offset: Offset(0, -1),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: RichText(
          text: TextSpan(
            text: element.textContent,
            style: style,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                try {
                  launch(element.attributes["href"]);
                } catch (_) {
                  assert(false);
                }
              },
          ),
        ),
      ),
    );
  }
}
