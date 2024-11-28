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

    return ListThemedTile(
      text: text,
      color: switch(type) {
        ListContraindicationTileType.intolerance => ListThemedTileColor.blue,
        ListContraindicationTileType.acute => ListThemedTileColor.red,
        ListContraindicationTileType.chronic => ListThemedTileColor.orange,
        ListContraindicationTileType.pediatric => ListThemedTileColor.green,
      }
    );

  }
}

enum ListContraindicationTileType {
  intolerance,
  acute,
  chronic,
  pediatric,
}
