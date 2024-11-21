// lib/pages/home/page.home.dart

import 'package:flutter/material.dart';

import '../../models/home_item.dart';
import 'widgets/home.menu_item.dart';

import '../menus/menu.medications/page.menu.medications.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Define a list of menu items
  final List<HomeMenuItemModel> menuItems = const [
    HomeMenuItemModel(title: 'Medikamente', icon: Icons.vaccines, target: MenuMedicationsPage()),
    HomeMenuItemModel(title: 'Schemata', icon: Icons.account_tree, target: null),
    HomeMenuItemModel(title: 'Rechner', icon: Icons.calculate, target: null),
    HomeMenuItemModel(title: 'Patienten-Dosis', icon: Icons.monitor_heart, isImportant: true, target: null),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotSan-Taschenbuch'),
        centerTitle: true,
        toolbarHeight: 64.0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: menuItems.length,
        separatorBuilder: (context, index) {
          return const Divider(
            thickness: 0.5,
            indent: 8.0,
            endIndent: 8.0,
            height: 0,
          );
        },
        itemBuilder: (context, index) {
          final item = menuItems[index];
          final isLastItem = index == menuItems.length - 1;
          return HomeMenuItem(
            item: item,
            isImportant: isLastItem,
            onTap: () {
              if (item.target == null) { return; }
              Navigator.push(context, MaterialPageRoute(builder: (context) => item.target!));
            },
          );
        },
      ),
    );
  }
}