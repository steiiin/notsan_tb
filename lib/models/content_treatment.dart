import 'package:flutter/material.dart';
import 'package:notsan_tb/models/content.dart';

class TreatmentContent extends Content {

  final TreatmentContent? parent;
  final Widget fragmentDescription;

  const TreatmentContent({
    required super.name,
    super.altnames,
    super.searchnames,
    this.parent,
    required this.fragmentDescription,
  }) : super();

  bool hasParent() => parent != null;

}
