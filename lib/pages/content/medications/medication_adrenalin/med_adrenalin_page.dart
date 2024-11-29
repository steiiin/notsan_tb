import 'package:flutter/material.dart';
import 'package:notsan_tb/data/medications.dart' as medications;
import 'package:notsan_tb/data/treatments.dart' as treatments;
import 'package:notsan_tb/models/content_medication.dart';
import 'package:notsan_tb/pages/content/medications/pageframe_medicationcontent.dart';
import 'package:notsan_tb/pages/content/medications/widgets/content.med_scheme.dart';
import 'package:notsan_tb/pages/content/medications/widgets/content.med_package.dart';
import 'package:notsan_tb/pages/content/medications/widgets/content.med_scheme_descriptive.dart';
import 'package:notsan_tb/pages/content/medications/widgets/content.med_scheme_dosage.dart';
import 'package:notsan_tb/pages/content/medications/widgets/list.contraindication_tile.dart';
import 'package:notsan_tb/pages/content/medications/widgets/list.sideeffect_tile.dart';
import 'package:notsan_tb/widgets/list.separator.dart';

class MedAdrenalinPage extends MedicationContentPage {

  const MedAdrenalinPage({ super.key });

  @override
  Widget build(BuildContext context) {

    final String name = medications.adrenalin.name;
    final String altnames = medications.adrenalin.getAltnamesJoined();

    return MedicationContentPageFrame(
      pageTitle: name,
      pageSubtitle: altnames,
      listContraindications: const ListContraindicationTile(
        text: "**Keine**, wegen Lebensgefahr!", type: ListContraindicationTileType.none
      ),
      listSideeffects: const Column(
        children: [
          ListSideeffectTile(text: "**Herzfrequenzanstieg**", type: ListSideeffectTileType.critical),
          ListSideeffectTile(text: "**Blutdruckanstieg**", type: ListSideeffectTileType.critical),
          ListSideeffectTile(text: "**Angina Pectoris** (durch erhöhten Sauerstoffbedarf am Herzen)", type: ListSideeffectTileType.critical),
          ListSideeffectTile(text: "Herzrythmusstörungen", type: ListSideeffectTileType.normal),
          ListSideeffectTile(text: "Angst & Unruhe", type: ListSideeffectTileType.normal),
          ListSideeffectTile(text: "Anwendung unterbrechen.", type: ListSideeffectTileType.countermeasure),
          ListSideeffectTile(text: "Wirkende abwarten. *(Wenige Sekunden)*", type: ListSideeffectTileType.countermeasure),
        ],
      ),
      mapDosages: const {
        treatments.cpr: Column(
          children: [
            ContentMedPackage(
              type: MedicationPackageType.singleAmpoule,
              title: "Ampulle 'Adrenalin'",
              incredients: '`1mg / 1ml`'
            ),
            ListSeparator(),
            ContentMedScheme(
              type: ContentMedSchemeType.usage,
              children: [
                MedSchemeDescription(
                  '# Schockbar (VF, VT) \n'
                  'Nach dem 3. erfolglosen Schock'
                ),
                SizedBox(height: 4.0),
                MedSchemeDescription(
                  '# Nicht Schockbar (PEA, Asystolie) \n'
                  'So Schnell, wie möglich.'
                )
              ]
            ),
            ContentMedScheme(
              type: ContentMedSchemeType.iv,
              children: [
                MedSchemeDosage('1mg (Ampulle)', target: ContentMedDosageTarget.adult),
                ListSeparator(noIndent: true),
                MedSchemeDescription(
                  '# Bei Kindern: \n'
                  'Auf `20ml` **NaCl** aufziehen, dann:'
                ),
                MedSchemeDosage('0,01mg / kgKG', target: ContentMedDosageTarget.child),
                MedSchemeDosage('   1ml / 5kgKG', target: ContentMedDosageTarget.child, ownTarget: '')
              ]
            )
          ],
        ),
        treatments.bradycardia: Column(
          children: [
            ContentMedPackage(
              type: MedicationPackageType.singleAmpoule,
              title: "Ampulle 'Adrenalin'",
              incredients: '`1mg / 1ml`'
            ),
            ListSeparator(),
            ContentMedScheme(
              type: ContentMedSchemeType.iv,
              children: [
                MedSchemeDosage('2-10µg / min', target: ContentMedDosageTarget.none),
                ListSeparator(noIndent: true),
                MedSchemeDescription(
                  '# Perfusor benutzen: \n'
                  'Auf `50ml` **NaCl** aufziehen:'
                ),
                MedSchemeDosage('= 20µg / ml', target: ContentMedDosageTarget.none),
                ListSeparator(noIndent: true),
                MedSchemeDosage('0,1 - 0,5ml / min', target: ContentMedDosageTarget.none),
                MedSchemeDosage('  6 -  30ml / h', target: ContentMedDosageTarget.none),
                ListSeparator(noIndent: true),
                MedSchemeDescription(
                  'Herzfrequenz *minütlich* **kontrollieren**, \n'
                  'Laufrate **korrigieren**.'
                ),
              ]
            )
          ],
        ),
        treatments.anaphylaxie: Column(
          children: [
            ContentMedPackage(
              type: MedicationPackageType.singleAmpoule,
              title: "Ampulle 'Adrenalin'",
              incredients: '`1mg / 1ml`'
            ),
            ListSeparator(),
            ContentMedScheme(
              type: ContentMedSchemeType.im,
              children: [
                MedSchemeDosage(' 0,5mg (½ Ampulle)', target: ContentMedDosageTarget.adult, ownTarget: 'AB 12 JAHREN'),
                MedSchemeDosage(' 0,3mg', target: ContentMedDosageTarget.senior, ownTarget: 'KIND (6-12 J.)'),
                MedSchemeDosage('0,15mg', target: ContentMedDosageTarget.child, ownTarget: 'KIND (< 6 J.)'),
                ListSeparator(noIndent: true),
                MedSchemeDescription(
                  '`1ml`-Spritze verwenden! \\\n'
                  'Nicht benötigte Menge vor Applikation **verwerfen**.'
                ),
                ListSeparator(noIndent: true),
                MedSchemeDescription(
                  'Repetition nach **5min** möglich.'
                ),
              ]
            )
          ],
        ),
        treatments.pseudocroup: Column(
          children: [
            ContentMedPackage(
              type: MedicationPackageType.singleAmpoule,
              title: "Ampulle 'Adrenalin'",
              incredients: '`1mg / 1ml`'
            ),
            ListSeparator(),
            ContentMedScheme(
              type: ContentMedSchemeType.inhale,
              children: [
                MedSchemeDosage('2mg (2 Ampullen)', target: ContentMedDosageTarget.none, ownColor: Colors.red),
                MedSchemeDescription(
                  'In **Verneblungsmaske** `+2ml` NaCl'
                ),
              ]
            )
          ],
        ),
      },
      pharmOnset: '~ **30s**',
      pharmDuration: '~ **2min**',
      principle:
        '### Gehört zu den **Katecholaminen** \n'
        'Adrenalin wirkt als körpereigenes Hormon und Neurotransmitter.'
        'Es bindet an **alpha- und beta-Adrenozeptoren** und entfaltet so seine vielseitigen Effekte auf das Herz-Kreislauf-System, die Bronchien und den Stoffwechsel. '
        'Besonders in der Notfallmedizin wird Adrenalin wegen seiner **starken stimulierenden Wirkung auf das Herz** und seiner Fähigkeit, den Blutdruck zu stabilisieren, eingesetzt. \n\n'
        'Die Wirkung von Adrenalin ist dosisabhängig: Bei niedrigen Dosierungen überwiegen die **beta-adrenergen Effekte**, wie eine Erhöhung der Herzfrequenz (**positiv chronotrop**) und der Kontraktionskraft (**positiv inotrop**), sowie eine **Bronchodilatation** durch Stimulation der β2-Rezeptoren.'
        'Bei höheren Dosierungen dominieren die **alpha-adrenergen Effekte**, die eine Vasokonstriktion bewirken und damit den peripheren Widerstand und den Blutdruck erhöhen. Diese duale Wirkung macht Adrenalin unverzichtbar in der Behandlung von **kardiogenem Schock**, **Reanimationssituationen** und **anaphylaktischem Schock**. \n\n'
        'Neben seinen kardiovaskulären Wirkungen hat Adrenalin auch **metabolische Effekte**, wie die Förderung der Glykogenolyse und Lipolyse, um die Energiebereitstellung zu steigern. '
        'Die Anwendung erfordert allerdings Vorsicht, da es bei zu hohen Dosierungen zu **Tachykardien**, **Arrhythmien** und einer übermäßigen Myokardbelastung kommen kann. '
      );

  }
}
