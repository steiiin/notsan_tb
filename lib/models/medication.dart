// lib/models/medication.dart

import 'package:notsan_tb/models/med_contra.dart';
import 'package:notsan_tb/models/med_indication.dart';

class MedicationModel {

  final String name;
  final String altnames;
  final bool isDocMed;

  final List<Indication> indications;
  final List<Contraindication> contras;

  const MedicationModel({
    required this.name,
    this.altnames = "",
    this.isDocMed = false,
    this.indications = const [],
    this.contras = const [],
  });

}
