// lib/pages/content/content_medication/page.content_medication.dart

import 'package:flutter/material.dart';
import 'package:notsan_tb/models/medication.dart';
import 'package:notsan_tb/pages/content/content_medication/widgets/med_indications.dart';
import 'package:notsan_tb/widgets/card.expander.dart';

class ContentMedicationPage extends StatelessWidget {

  final MedicationModel medication;
  const ContentMedicationPage({
    super.key,
    required this.medication,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 64.0, // AppBar height remains fixed
            flexibleSpace: SafeArea(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  // Calculate scroll progress: 1.0 when expanded, 0.0 when collapsed
                  final double scrollProgress = (constraints.maxHeight - kToolbarHeight) /
                      (64.0 - kToolbarHeight);

                  // Clamp progress between 0 and 1 for safe opacity calculation
                  final double clampedProgress = scrollProgress.clamp(0.0, 1.0);

                  return Stack(
                    children: [
                      // If subtitle is present, show title and subtitle (fades out on scroll)
                      if (medication.altnames.isNotEmpty)
                        Opacity(
                          opacity: clampedProgress,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 72.0, // Accounts for back arrow and padding
                              right: 16.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    medication.name,
                                    style: Theme.of(context).textTheme.titleLarge,
                                  ),
                                  Text(
                                    medication.altnames,
                                    style: Theme.of(context).textTheme.labelSmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      // Always show app bar title (fades in on scroll)
                      Opacity(
                        opacity: medication.altnames.isNotEmpty
                            ? 1.0 - clampedProgress
                            : 1.0, // Always visible if no subtitle
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 72.0, // Accounts for back arrow and padding
                            right: 16.0,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              medication.name,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                MedIndications(indications: medication.indications),
              ],
            )
          )
        ],
      )
    );

  }
}
