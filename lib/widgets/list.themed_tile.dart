// lib/pages/home/widgets/home.menu_item.dart

import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ListThemedTile extends StatelessWidget {
  final String text;
  final ListThemedTileIcon icon;
  final ListThemedTileColor color;
  const ListThemedTile({
    super.key,
    required this.text,
    this.icon = ListThemedTileIcon.normal,
    this.color = ListThemedTileColor.normal,
  });

  Color getMixedAccent(BuildContext context, Color base, Color accent) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final double factor = isDark ? 0.3 : 0.7;
    return Color.lerp(base, accent, factor)!;
  }

  @override
  Widget build(BuildContext context) {

    final baseColor = Theme.of(context).colorScheme.onSurface;
    final tileColor = switch(color) {
      ListThemedTileColor.red => getMixedAccent(context, baseColor, Colors.red),
      ListThemedTileColor.green => getMixedAccent(context, baseColor, Colors.green),
      ListThemedTileColor.blue => getMixedAccent(context, baseColor, Colors.blue),
      ListThemedTileColor.orange => getMixedAccent(context, baseColor, Colors.yellow),
      _ => baseColor,
    };

    final iconWidget = switch(icon) {
      ListThemedTileIcon.double => const Icon(Icons.keyboard_double_arrow_right_rounded, size: 18.0),
      _ => Icon(Icons.chevron_right_rounded, size: 18.0, color: tileColor),
    };

    return ListTile(
      leading: iconWidget,
      dense: true,
      minTileHeight: 0.0,
      minLeadingWidth: 0.0,
      horizontalTitleGap: 6.0,
      contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
      title: MarkdownBody(
        data: text,
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
          p: TextStyle(
            color: tileColor
          )
        ),
      ),
    );
  }
}

enum ListThemedTileIcon {
  normal,
  double,
}

enum ListThemedTileColor {
  normal,
  red,
  blue,
  orange,
  green,
}
