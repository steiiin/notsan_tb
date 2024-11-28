import 'package:flutter/material.dart';
import 'package:notsan_tb/models/home_item.dart';
import 'package:notsan_tb/widgets/list.separator.dart';
import 'package:notsan_tb/pages/home/widgets/home.menu_item.dart';
import 'package:notsan_tb/pages/menus/menu_medications/page.menu_medications.dart';

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
          return const ListSeparator();
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