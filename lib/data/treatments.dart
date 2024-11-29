import 'package:flutter/material.dart';
import 'package:notsan_tb/models/content_treatment.dart';

const acs = TreatmentContent(
  name: 'Akutes Koronarsyndrom (ACS)',
  fragmentDescription: Column() /* TODO: add content */
);

const anaphylaxie = TreatmentContent(
  name: 'Anaphylaxie',
  fragmentDescription: Column() /* TODO: add content */
);

const bradycardia = TreatmentContent(
  name: 'Instabile Bradykardie',
  fragmentDescription: Column() /* TODO: add content */
);

const cpr = TreatmentContent(
  name: 'Reanimation',
  fragmentDescription: Column() /* TODO: add content */
);

const pseudocroup = TreatmentContent(
  name: 'Pseudokrupp',
  fragmentDescription: Column() /* TODO: add content */
);

const List<TreatmentContent> treatments = [
  acs,
  anaphylaxie,
  bradycardia,
  cpr,
  pseudocroup,
];