import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class MedSchemeDescription extends StatelessWidget {

  final String data;
  const MedSchemeDescription(this.data, { super.key });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: MarkdownBody(data: data)
    );
  }

}
