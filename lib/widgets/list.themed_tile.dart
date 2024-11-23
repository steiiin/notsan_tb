// lib/pages/home/widgets/home.menu_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ListThemedTile extends StatelessWidget {
  final String text;
  const ListThemedTile({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.arrow_right_sharp), // Little arrow in front
      dense: true,
      minTileHeight: 0.0,
      minLeadingWidth: 0.0,
      horizontalTitleGap: 4.0,
      title: MarkdownBody(
        data: text
      ),
    );
  }
}
