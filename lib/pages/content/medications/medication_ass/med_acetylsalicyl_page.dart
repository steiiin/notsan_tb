import 'package:flutter/material.dart';
import 'package:notsan_tb/data/medications.dart' as medications;
import 'package:notsan_tb/data/treatments.dart' as treatments;
import 'package:notsan_tb/models/content_medication.dart';
import 'package:notsan_tb/models/content_treatment.dart';
import 'package:notsan_tb/pages/content/medications/pageframe_medicationcontent.dart';
import 'package:notsan_tb/pages/content/medications/widgets/list.contraindication_tile.dart';
import 'package:notsan_tb/pages/content/medications/widgets/list.indication_tile.dart';
import 'package:notsan_tb/pages/content/medications/widgets/list.sideeffect_tile.dart';
import 'package:notsan_tb/pages/content/medications/widgets/list.sideeffect_countertreat.dart';
import 'package:notsan_tb/widgets/list.separator.dart';

class MedAcetylsalicylPage extends MedicationContentPage {

  const MedAcetylsalicylPage({ super.key });

  @override
  Widget build(BuildContext context) {

    final String name = medications.acetylsalicyl.name;
    final String altnames = medications.acetylsalicyl.getAltnamesJoined();
    final TreatmentContent treatment = medications.acetylsalicyl.treatment;

    return MedicationContentPageFrame(
      pageTitle: name,
      pageSubtitle: altnames,
      listIndications: ListIndicationTile(treatment: treatment),
      listContraindications: const Column(
        children: [
          ListContraindicationTile(text: "**Unverträglichkeit** ggb. NSAR (z.B. Ibu, Diclo)", type: ListContraindicationTileType.intolerance),
          ListSeparator(useSpace: true),
          ListContraindicationTile(text: "Vd. auf **Innere Blutungen**", type: ListContraindicationTileType.acute),
          ListContraindicationTile(text: "Vd. auf **Aortensyndrom**", type: ListContraindicationTileType.acute),
          ListContraindicationTile(text: "**Asthmaanfall**", type: ListContraindicationTileType.acute),
          ListContraindicationTile(text: "Akute **Magen**- oder **Darmgeschwüre**", type: ListContraindicationTileType.acute),
          ListSeparator(useSpace: true),
          ListContraindicationTile(text: "Schwere Nierenfunktionsstörung (**z.B. Dialyse**)", type: ListContraindicationTileType.chronic),
          ListContraindicationTile(text: "Schwerer Leberschaden (**Leberzirrhose**)", type: ListContraindicationTileType.chronic),
          ListSeparator(useSpace: true),
          ListContraindicationTile(text: "**Schwangerschaft** (ab 28. Woche / 6. Monat)", type: ListContraindicationTileType.pediatric),
          ListContraindicationTile(text: "**Keine Kinder** (<18J durch SAA untersagt)", type: ListContraindicationTileType.pediatric),
        ],
      ),
      listSideeffects: const Column(
        children: [
          ListSideeffectTile(text: "NSAR-**Allergie**", type: ListSideeffectTileType.critical),
          ListSideeffectTile(text: "Luftnot (**Asthmaanfall**)", type: ListSideeffectTileType.criticalDeclarative),
          ListSideeffectTile(text: "Übelkeit, **Erbrechen**", type: ListSideeffectTileType.criticalDeclarative),
          ListSideeffectTile(text: "Magenschmerzen", type: ListSideeffectTileType.declarative),
          ListSideeffectTile(text: "Ausschlag", type: ListSideeffectTileType.declarative),
          ListSideeffectTile(text: "Andere SAA beachten:", type: ListSideeffectTileType.countermeasure),
          ListSideeffectCounterTreatment(treatment: treatments.anaphylaxie),
          ListSeparator(),
          ListSideeffectTile(text: "Erhöhte **Blutungsneigung**")
        ],
      ),
      mapDosages: const {
        'Akutes Koronarsyndrom': Column(
          children: [
            ListSeparator()
          ]
        ),
      },
      pharmOnset: '~ **3 min**',
      pharmDuration: '~ **bis 7 Tage** (Blutgerinnung)',
      principle:
        "### Nichtsteroidales Antirheumatikum (NSAR) \n"
        'Ihr Hauptwirkmechanismus besteht in der irreversiblen Hemmung der Cyclooxygenasen (COX-1 und COX-2).'
        'Dadurch wird die Bildung von Prostaglandinen gehemmt, die an Entzündungsreaktionen, Schmerzempfindung und Fieber beteiligt sind.'
        'Besonders relevant für die Notfallmedizin ist die **dauerhafte Hemmung der Thrombozytenaggregation** durch die Blockade von COX-1 in den Thrombozyten. \n\n'
        'Die Hemmung der Thrombozytenaggregation bewirkt eine **verminderte Bildung von Thromboxan A2**, einem Stoff, der Thrombozyten aktiviert und die Vasokonstriktion fördert.'
        'Dieser Effekt ist irreversibel und hält über die Lebensdauer der Thrombozyten (7–10 Tage) an.'
        'Dies macht ASS zu einem zentralen Medikament bei der **akuten Behandlung von Myokardinfarkten** und anderen thromboembolischen Ereignissen. \n\n'
        'Darüber hinaus hat ASS entzündungshemmende, schmerzlindernde und fiebersenkende Eigenschaften.'
        'Diese Effekte treten bei höheren Dosierungen auf und sind weniger spezifisch in der Notfallmedizin.'
        'Der Einsatz von ASS erfordert jedoch besondere Vorsicht, da es bei Überdosierung oder bei prädisponierten Patienten zu **Magen-Darm-Blutungen** und anderen Nebenwirkungen kommen kann.'
    );

  }
}
