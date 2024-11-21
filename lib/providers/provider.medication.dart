// lib/providers/provider.medication.dart

import 'package:flutter/material.dart';
import 'package:notsan_tb/models/medication.dart';
import 'package:notsan_tb/data/medications.dart' as data;

class MedicationProvider with ChangeNotifier {
  final List<MedicationModel> _medications = data.medications;
  List<MedicationModel> get medications => _medications;
}
