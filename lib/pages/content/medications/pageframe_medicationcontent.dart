import 'package:flutter/material.dart';
import 'package:notsan_tb/models/content_medication.dart';
import 'package:notsan_tb/pages/content/medications/widgets/content.pharmakodynamics.dart';
import 'package:notsan_tb/pages/content/medications/widgets/content.pharmakokinetik.dart';
import 'package:notsan_tb/pages/content/pageframe_content.dart';
import 'package:notsan_tb/widgets/expander_card.dart';
import 'package:notsan_tb/widgets/list.separator.dart';

class MedicationContentPageFrame extends MedicationContentPage {

  final String pageTitle;
  final String pageSubtitle;

  final Widget listIndications;
  final Widget listContraindications;
  final Widget listSideeffects;
  final Map<String, Widget> mapDosages;
  final String pharmOnset;
  final String pharmDuration;
  final String principle;

  const MedicationContentPageFrame({ super.key,
    required this.pageTitle,
    required this.pageSubtitle,
    required this.listIndications,
    required this.listContraindications,
    required this.listSideeffects,
    required this.mapDosages,
    required this.pharmOnset,
    required this.pharmDuration,
    required this.principle,
  });

  @override
  Widget build(BuildContext context) {

    final List<Widget> dosages = [];
    mapDosages.forEach((name, widget) {

      if (dosages.isNotEmpty) {
        dosages.add(const ListSeparator());
      }

      dosages.add(CardExpander(
        title: name,
        icon: const Icon(Icons.add_box_outlined),
        child: widget
      ));

    });

    return ContentPageFrame(
      title: pageTitle,
      subtitle: pageSubtitle,
      children: [

        CardExpander(
          title: 'Indikationen',
          child: listIndications,
        ),
        CardExpander(
          title: 'Kontraindikationen',
          child: listContraindications,
        ),
        CardExpander(
          title: 'Nebenwirkungen',
          child: listSideeffects,
        ),

        ...dosages,

        CardExpander(
          title: 'Pharmakokinetik',
          child: Column(
            children: [
              ContentPharmacokinetics(
                onset: pharmOnset,
                duration: pharmDuration,
              ),
              const ListSeparator(),
              ContentPharmacodynamics(
                data: principle
              ),
            ]
          )
        ),

      ]
    );

  }

}
