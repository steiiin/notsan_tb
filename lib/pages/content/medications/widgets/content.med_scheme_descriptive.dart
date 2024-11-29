import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MedSchemeDescription extends StatelessWidget {

  final String data;
  const MedSchemeDescription(this.data, { super.key });

  @override
  Widget build(BuildContext context) {

    final mdTitle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontSize: 13.0,
      letterSpacing: 0,
      decoration: TextDecoration.underline,
      fontWeight: FontWeight.w600,
      decorationThickness: 1,
    );

    final mdCodeStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      height: 1.1,
      fontFamily: 'monospace',
    );

    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: MarkdownBody(
        data: data,
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
          h1: mdTitle,
          code: mdCodeStyle,
          blockSpacing: 0.0,
        ),
      )
    );
  }

}
