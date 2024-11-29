import 'package:notsan_tb/models/content_medication.dart';
import 'package:notsan_tb/pages/content/medications/medication_acetylsalicyl/import_acetylsalicyl.dart';
import 'package:notsan_tb/pages/content/medications/medication_adrenalin/import_adrenalin.dart';

const acetylsalicyl = MedicationContent(
  name: 'Acetylsalicylsäure', altnames: [ 'ASS', 'Aspirin', 'Aspisol' ],
  contentPage: MedAcetylsalicylPage()
);

const adrenalin = MedicationContent(
  name: 'Adrenalin', altnames: [ 'Epinephrin', 'Suprarenin' ],
  contentPage: MedAdrenalinPage()
);

const List<MedicationContent> medications = [
  acetylsalicyl,
  adrenalin,
];
