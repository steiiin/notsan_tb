import 'package:flutter/material.dart';
import 'package:notsan_tb/widgets/list.themed_tile.dart';

class ListContraindicationTile extends StatelessWidget {

  final String text;
  final ListContraindicationTileType type;

  const ListContraindicationTile({ super.key,
    required this.text,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {

    final tileIcon = switch(type) {
      ListContraindicationTileType.none => ListThemedTileIcon.check,
      _ => ListThemedTileIcon.normal,
    };
    final tileColor = switch(type) {
      ListContraindicationTileType.intolerance => ListThemedTileColor.blue,
      ListContraindicationTileType.acute => ListThemedTileColor.red,
      ListContraindicationTileType.chronic => ListThemedTileColor.orange,
      ListContraindicationTileType.pediatric => ListThemedTileColor.green,
      ListContraindicationTileType.none => ListThemedTileColor.brightGreen,
    };

    return ListThemedTile(
      text: text,
      icon: tileIcon,
      color: tileColor,
    );

  }
}

enum ListContraindicationTileType {
  intolerance,
  acute,
  chronic,
  pediatric,
  none,
}
