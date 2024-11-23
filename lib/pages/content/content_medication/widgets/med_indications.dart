// lib/pages/content/content_medication/widgets/med_indications.dart

import 'package:flutter/material.dart';
import 'package:notsan_tb/models/med_indication.dart';
import 'package:notsan_tb/widgets/card.expander.dart';
import 'package:notsan_tb/widgets/list.separator.dart';
import 'package:notsan_tb/widgets/list.themed_tile.dart';

class MedIndications extends StatelessWidget {
  final List<Indication> indications;
  const MedIndications({ super.key,
    required this.indications
  });

  @override
  Widget build(BuildContext context) {

    List<Widget> indList = [];
    for (int i = 0; i < indications.length; i++) {
      indList.add(const ListSeparator());
      indList.add(ListThemedTile(text: indications[i].name));
      if (i < indications.length - 1) {

      }
    }

    return CardExpander(
      title: 'Indikationen',
      children: indList,
    );
  }
}
