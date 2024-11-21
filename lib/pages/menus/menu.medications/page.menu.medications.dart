// lib/pages/menus/menu.medications/page.menu.medications.dart

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import '../../../models/medication.dart';

class MenuMedicationsPage extends StatelessWidget {
  const MenuMedicationsPage({super.key});

  // Function to determine the group (first letter or '#')
  String _getGroup(MedicationModel medication) {
    final firstChar = medication.title[0].toUpperCase();
    if (RegExp(r'[A-Z]').hasMatch(firstChar)) {
      return firstChar;
    }
    return '#';
  }

  @override
  Widget build(BuildContext context) {

    

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medikamente'),
      ),
      body: const Center(
        child: Text('Welcome to ListA Page!'),
      ),
    );
  }
}
