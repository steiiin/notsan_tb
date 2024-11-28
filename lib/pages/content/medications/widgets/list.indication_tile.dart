import 'package:flutter/material.dart';
import 'package:notsan_tb/models/content_treatment.dart';
import 'package:notsan_tb/widgets/list.themed_tile.dart';

class ListIndicationTile extends StatelessWidget {

  final TreatmentContent treatment;

  const ListIndicationTile({ super.key,
    required this.treatment,
  });

  @override
  Widget build(BuildContext context) {

    return ListThemedTile(
      text: treatment.name,
      onPressed: () => {}
    );

  }
}
