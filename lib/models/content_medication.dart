import 'package:flutter/material.dart';
import 'package:notsan_tb/models/content.dart';

class MedicationContent extends Content {

  final MedicationContentPage contentPage;
  final bool isDocMed;

  const MedicationContent({

    required super.name,
    super.altnames,
    super.searchnames,

    required this.contentPage,
    this.isDocMed = false,

  }) : super();

}

class MedicationContentPage extends StatelessWidget {
  const MedicationContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }

}

enum MedicationPackageType {
  vialWithAmpoule,
  singleVial,
  syringe,
  suppository,
  spray,
  inhaler,
  doubleAmpoule,
  singleAmpoule,
}
