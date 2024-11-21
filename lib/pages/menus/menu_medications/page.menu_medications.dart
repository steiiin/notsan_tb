// lib/pages/menus/menu.medications/page.menu.medications.dart

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:provider/provider.dart';
import 'package:notsan_tb/models/medication.dart';
import 'package:notsan_tb/providers/provider.medication.dart';
import 'package:notsan_tb/widgets/list.groupheader.dart';
import 'package:notsan_tb/widgets/list.separator.dart';

class MenuMedicationsPage extends StatelessWidget {
  const MenuMedicationsPage({super.key});

  // Function to determine the group (first letter or '#')
  String _getGroup(MedicationModel medication) {
    final firstChar = medication.name[0].toUpperCase();
    if (RegExp(r'[A-Z]').hasMatch(firstChar)) {
      return firstChar;
    }
    return '#';
  }

  @override
  Widget build(BuildContext context) {

    final medicationProvider = Provider.of<MedicationProvider>(context);
    final List<MedicationModel> medications = medicationProvider.medications;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medikamente'),
      ),
      body: GroupedListView<MedicationModel, String>(
        elements: medications,
        groupBy: _getGroup,
        groupSeparatorBuilder: (String groupByValue) => ListGroupHeader(headerValue: groupByValue),
        separator: const ListSeparator(),
        itemBuilder: (context, MedicationModel medication) {
          return ListTile(
            title: Text(medication.name),
            subtitle: medication.altnames.isNotEmpty ? Text(medication.altnames) : null,
            trailing: medication.isDocMed ? const Icon(Icons.taxi_alert) : null,
            onTap: () {
              // Handle tap
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${medication.name} tapped')),
              );
            },
          );
        },

        order: GroupedListOrder.ASC,
      ),
    );
  }
}
