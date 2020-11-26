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
    return MarkdownBody(
      data: data,
      builders: {
        // Handle p tags manually to not intercept onTaps for the flip card
        "p": BasicTextBuilder(),
        // Handle links separately:
        // https://github.com/flutter/flutter_markdown/issues/233
        "a": LinkBuilder(),
      },
      styleSheet: MarkdownStyleSheet(
        p: style ?? Theme.of(context).textTheme.bodyText2,
        h3: Theme.of(context).textTheme.bodyText2.copyWith(
              fontSize: 19,
            ),
        h4: Theme.of(context).textTheme.bodyText2.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
        strong: TextStyle(
          fontWeight: FontWeight.w500,
        ),
        blockquoteDecoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          border: Border(
            left: BorderSide(
              color: ColorsConfig.primarySwatch,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}

class BasicTextBuilder extends MarkdownElementBuilder {
  @override
  Widget visitText(md.Text text, TextStyle preferredStyle) {
    return RichText(
      text: TextSpan(
        text: text.text,
        style: preferredStyle,
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
    return MouseRegion(
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
    );
  }
}
