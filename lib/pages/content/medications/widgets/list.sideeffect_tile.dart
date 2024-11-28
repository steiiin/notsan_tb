import 'package:flutter/material.dart';
import 'package:notsan_tb/widgets/list.themed_tile.dart';

class ListSideeffectTile extends StatelessWidget {

  final String text;
  final ListSideeffectTileType type;

  const ListSideeffectTile({ super.key,
    required this.text,
    this.type = ListSideeffectTileType.normal,
  });

  @override
  Widget build(BuildContext context) {

    final ListThemedTileIcon icon = switch (type) {
      ListSideeffectTileType.critical => ListThemedTileIcon.double,
      ListSideeffectTileType.declarative => ListThemedTileIcon.point,
      ListSideeffectTileType.criticalDeclarative => ListThemedTileIcon.point,
      ListSideeffectTileType.countermeasure => ListThemedTileIcon.arrow,
      _ => ListThemedTileIcon.normal,
    };

    final ListThemedTileColor color = switch (type) {
      ListSideeffectTileType.critical => ListThemedTileColor.red,
      ListSideeffectTileType.criticalDeclarative => ListThemedTileColor.red,
      _ => ListThemedTileColor.neutral,
    };

    final isDeclarative = type == ListSideeffectTileType.declarative || type == ListSideeffectTileType.criticalDeclarative;
    final indent = isDeclarative ? 12.0 : 0.0;

    final tile = ListThemedTile(
      text: text,
      icon: icon,
      color: color,
      indent: indent,
      dense: isDeclarative,
    );

    if (isDeclarative) {
      return Opacity(
        opacity: 0.8,
        child: tile,
      );
    } else {
      return tile;
    }

  }
}

enum ListSideeffectTileType {
  normal,
  critical,
  declarative,
  criticalDeclarative,
  countermeasure,
}