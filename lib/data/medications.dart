import 'package:notsan_tb/models/content_medication.dart';
import 'package:notsan_tb/data/treatments.dart' as treatments;
import 'package:notsan_tb/pages/content/medications/medication_ass/import_ass.dart';

const acetylsalicyl = MedicationContent(
  name: 'Acetylsalicylsäure', treatment: treatments.acs,
  altnames: [ 'ASS', 'Aspirin', 'Aspisol' ],
  contentPage: MedAcetylsalicylPage()
);

const List<MedicationContent> medications = [
  acetylsalicyl,
];
