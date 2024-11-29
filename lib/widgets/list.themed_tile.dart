import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ListThemedTile extends StatelessWidget {

  final String text;

  final ListThemedTileIcon icon;
  final ListThemedTileColor color;

  final double indent;
  final bool dense;

  final VoidCallback? onPressed;

  const ListThemedTile({ super.key,
    required this.text,
    this.icon = ListThemedTileIcon.normal,
    this.color = ListThemedTileColor.neutral,
    this.indent = 0.0,
    this.dense = false,
    this.onPressed,
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
      ListThemedTileColor.brightGreen => getMixedAccent(context, baseColor, Colors.lightGreen),
      _ => baseColor,
    };

    final iconWidget = switch(icon) {
      ListThemedTileIcon.double => const Icon(Icons.keyboard_double_arrow_right_rounded, size: 18.0),
      ListThemedTileIcon.arrow => const Icon(Icons.arrow_forward_rounded, size: 18.0),
      ListThemedTileIcon.point => const Icon(Icons.circle, size: 4.0),
      ListThemedTileIcon.check => const Icon(Icons.check, size: 18.0),
      _ => Icon(Icons.chevron_right_rounded, size: 18.0, color: tileColor),
    };
    final iconWidgetSizePadding = (18.0 - iconWidget.size!) / 2;

    final tilePadding = EdgeInsets.only(left: 8.0 + indent, right: 8.0);

    return ListTile(
      leading: iconWidgetSizePadding > 0
        ? Padding(padding: EdgeInsets.symmetric(horizontal: iconWidgetSizePadding), child: iconWidget)
        : iconWidget,
      dense: false,
      minTileHeight: 0.0,
      minLeadingWidth: 18.0,
      horizontalTitleGap: 6.0,
      minVerticalPadding: dense ? 0.0 : 4.0,
      contentPadding: tilePadding,
      title: MarkdownBody(
        data: text,
        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
          p: TextStyle(
            color: tileColor
          ),
        ),
      ),
      trailing: onPressed != null
        ? Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(icon: const Icon(Icons.link), onPressed: onPressed)
          )
        : null,
    );
  }
}

enum ListThemedTileIcon {
  normal,
  double,
  arrow,
  point,
  check,
}

enum ListThemedTileColor {
  neutral,
  red,
  blue,
  orange,
  green,
  brightGreen,
}
