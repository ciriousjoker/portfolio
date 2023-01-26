import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_markdown/flutter_markdown.dart";
import "package:markdown/markdown.dart" as md;
import "package:portfolio/config/colors.config.dart";
import "package:url_launcher/url_launcher_string.dart";

class MarkdownWrapperWidget extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const MarkdownWrapperWidget({
    super.key,
    this.data = "",
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final styleP = style ?? Theme.of(context).textTheme.bodyMedium;

    return MarkdownBody(
      listItemCrossAxisAlignment: MarkdownListItemCrossAxisAlignment.start,
      data: data,
      onTapLink: (text, href, title) {
        try {
          launchUrlString(href!);
        } catch (_) {
          assert(false);
        }
      },
      styleSheet: MarkdownStyleSheet(
        p: styleP,
        h3: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 19,
            ),
        h4: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
        strong: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
        horizontalRuleDecoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ColorsConfig.projectDivider),
          ),
        ),
        em: TextStyle(
          color: styleP?.color?.withOpacity(0.5),
        ),
        blockquote: TextStyle(
          color: styleP?.color?.withOpacity(0.6),
        ),
        blockquoteDecoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          border: const Border(
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
    TextStyle? style,
  ) {
    return Transform.translate(
      // Fix a weird alignment issue. Might be fixed by Flutter in the future
      offset: const Offset(0, -1),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: RichText(
          text: TextSpan(
            text: element.textContent,
            style: style,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                try {
                  launchUrlString(element.attributes["href"]!);
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
