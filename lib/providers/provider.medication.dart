// lib/providers/provider.medication.dart

import 'package:flutter/material.dart';
import '../models/medication.dart';
import '../data/medications.dart' as data;

class MedicationProvider with ChangeNotifier {
  final List<MedicationModel> _medications = data.medications;
  List<MedicationModel> get medications => _medications;
}
