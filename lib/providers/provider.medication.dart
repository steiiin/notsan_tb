import 'package:flutter/material.dart';
import 'package:notsan_tb/data/medications.dart' as data;
import 'package:notsan_tb/models/content_medication.dart';

class MedicationProvider with ChangeNotifier {
  final List<MedicationContent> _medications = data.medications;
  List<MedicationContent> get medications => _medications;
}
