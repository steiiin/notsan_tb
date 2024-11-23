// lib/data/medications.dart

import 'package:notsan_tb/models/med_indication.dart';
import 'package:notsan_tb/models/medication.dart';

const acs = IndicationModel(name: "Akutes Koronarsyndrom (ACS)");

const List<MedicationModel> medications = [

  MedicationModel(
    name: 'Acetylsalicylsäure', altnames: 'ASS, Aspirin, Aspisol', isDocMed: false,
    indications: [ acs ],
    contra: [
      
    ]
  ),

];
