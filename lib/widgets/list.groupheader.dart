// lib/pages/home/widgets/home.menu_item.dart

import 'package:flutter/material.dart';

class ListGroupHeader extends StatelessWidget {
  final String headerValue;
  const ListGroupHeader({
    super.key,
    required this.headerValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 8.0, right: 8.0, bottom: 4.0),
      child: Text(
        headerValue,
        style: Theme.of(context).textTheme.titleSmall,
      )
    );
  }
}
