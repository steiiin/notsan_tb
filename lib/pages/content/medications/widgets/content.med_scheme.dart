import 'package:flutter/material.dart';

class ContentMedScheme extends StatelessWidget {

  final ContentMedSchemeType type;
  final List<Widget> children;

  final bool useDivider;

  const ContentMedScheme({ super.key,
    required this.type,
    required this.children,
    this.useDivider = false,
  });

  Color getMixedAccent(BuildContext context, Color base, Color accent) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final double factor = isDark ? 0.3 : 0.7;
    return Color.lerp(base, accent, factor)!;
  }

  @override
  Widget build(BuildContext context) {

    final baseColor = Theme.of(context).colorScheme.surface;
    final typeColor = switch(type) {
      ContentMedSchemeType.iv => const Color.fromARGB(255, 255, 214, 211),
    };

    final schemeColor = getMixedAccent(context, baseColor, typeColor);
    final schemeDivider = useDivider ? BoxDecoration(
      border: Border(
        left: BorderSide(
          width: 2.0,
          color: schemeColor,
        )
      )
    ) : null;

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
      child: Table(
      columnWidths: const {
        0: FixedColumnWidth(54.0),
        1: FlexColumnWidth(1),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            Text("i.v.",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall
            ),
            Container(
              padding: const EdgeInsets.only(left: 4.0),
              decoration: schemeDivider,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: children,
              )
            ),
          ],
        ),
      ],
    )
    );

  }

}

enum ContentMedSchemeType {
  iv,
}