import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ContentPharmacodynamics extends StatelessWidget {

  final String data;

  const ContentPharmacodynamics({ super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MarkdownBody(
        data: data
      )
    );

  }

}
