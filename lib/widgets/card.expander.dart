// lib/pages/home/widgets/home.menu_item.dart

import 'package:flutter/material.dart';

class CardExpander extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const CardExpander({
    super.key,
    required this.title,
    required this.children
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),

        shape: const Border(),
        collapsedShape: const Border(),
        initiallyExpanded: true,

        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              children: children,
            ),
          )
        ],
      ),
    );
  }
}
