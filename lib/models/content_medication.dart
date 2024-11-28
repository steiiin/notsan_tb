import 'package:flutter/material.dart';
import 'package:notsan_tb/models/content.dart';
import 'package:notsan_tb/models/content_treatment.dart';

class MedicationContent extends Content {

  final TreatmentContent treatment;
  final MedicationContentPage contentPage;
  final bool isDocMed;

  const MedicationContent({

    required super.name,
    super.altnames,
    super.searchnames,

    required this.treatment,
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


// TODO: remove all after this after refactoring



class MedicationIndication {

  final TreatmentContent treatment;
  final List<MedicationDosage> dosages;
  final Widget? prerequisites;

  const MedicationIndication({
    required this.treatment,
    required this.dosages,
    this.prerequisites,
  });

}

class MedicationPackage extends StatelessWidget {

  final MedicationPackageType type;
  final String id;

  const MedicationPackage({ super.key,
    required this.type,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

}
class MedicationDosage extends StatelessWidget {

  final MedicationPackage package;

  const MedicationDosage({ super.key,
    required this.package
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

}

enum MedicationPackageType {
  singleAmpoule,
  doubleAmpoule,
  singleVial,
  vialWithAmpoule,
  syringe,
  spray,
  inhaler,
  suppository,
}
