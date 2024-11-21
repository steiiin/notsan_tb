// lib/models/medication.dart

import 'package:notsan_tb/models/med_indication.dart';

class MedicationModel {

  final String name;
  final String altnames;
  final bool isDocMed;

  final List<IndicationModel> indications;

  const MedicationModel({
    required this.name,
    this.altnames = "",
    this.isDocMed = false,
    this.indications = const [],
  });

}
