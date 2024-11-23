// lib/pages/content/content_medication/widgets/med_contras.dart

import 'package:flutter/material.dart';
import 'package:notsan_tb/models/med_contra.dart';
import 'package:notsan_tb/widgets/card.expander.dart';
import 'package:notsan_tb/widgets/list.separator.dart';
import 'package:notsan_tb/widgets/list.themed_tile.dart';

class MedContras extends StatelessWidget {
  final List<Contraindication> contras;
  const MedContras({ super.key,
    required this.contras
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> ciList = [];
    for (int i = 0; i < contras.length; i++) {
      ciList.add(const ListSeparator());
      ciList.add(
        ListThemedTile(
          text: contras[i].text,
          color: switch(contras[i].type) {
            ContraindicationType.intolerance => ListThemedTileColor.blue,
            ContraindicationType.acute => ListThemedTileColor.red,
            ContraindicationType.chronic => ListThemedTileColor.orange,
            ContraindicationType.pediatric => ListThemedTileColor.green,
            _ => ListThemedTileColor.normal,
          }
        ),
      );
    }

    return CardExpander(
      title: 'Kontraindikationen',
      children: ciList,
    );
  }
}
