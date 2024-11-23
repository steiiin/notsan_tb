// lib/data/medications.dart

import 'package:notsan_tb/models/med_contra.dart';
import 'package:notsan_tb/models/med_indication.dart';
import 'package:notsan_tb/models/medication.dart';

const acs = Indication(name: "Akutes Koronarsyndrom (ACS)");

const List<MedicationModel> medications = [

  MedicationModel(
    name: 'Acetylsalicylsäure', altnames: 'ASS, Aspirin, Aspisol', isDocMed: false,
    indications: [ acs ],
    contras: [
      Contraindication(text: "**Unverträglichkeit** ggb. ASS oder anderen NSAR (z.B. Ibu, Diclo)", type: ContraindicationType.intolerance),
      Contraindication(text: "Vd. auf **Innere Blutungen**", type: ContraindicationType.acute),
      Contraindication(text: "Vd. auf **Aortensyndrom**", type: ContraindicationType.acute),
      Contraindication(text: "**Asthmaanfall**", type: ContraindicationType.acute),
      Contraindication(text: "Akutes **Leberversagen** (Ikterus, Azetongeruch)", type: ContraindicationType.acute),
      Contraindication(text: "Akute **Magen**- oder **Darmgeschwüre**", type: ContraindicationType.acute),
      Contraindication(text: "Schweres Nierenfunktionsstörung (**z.B. Dialyse**)", type: ContraindicationType.chronic),
      Contraindication(text: "Schwerer Leberschaden (**Leberzirrhose**)", type: ContraindicationType.chronic),
      Contraindication(text: "**Schwangerschaft** (ab 28. Woche / 6. Monat)", type: ContraindicationType.pediatric),
      Contraindication(text: "**Keine Kinder** (<18J durch SAA untersagt)", type: ContraindicationType.pediatric),
    ]
  ),

];
