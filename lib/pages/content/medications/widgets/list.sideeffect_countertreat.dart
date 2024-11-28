import 'package:flutter/material.dart';
import 'package:notsan_tb/models/content_treatment.dart';

class ListSideeffectCounterTreatment extends StatelessWidget {

  final TreatmentContent treatment;

  const ListSideeffectCounterTreatment({ super.key,
    required this.treatment,
  });

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, bottom: 4.0, top: 0.0),
        child: FilledButton.tonal(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          child: Text(treatment.name),
        )
      )
    );

  }
}
