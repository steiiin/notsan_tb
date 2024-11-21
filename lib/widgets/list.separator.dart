// lib/pages/home/widgets/home.menu_item.dart

import 'package:flutter/material.dart';

class ListSeparator extends StatelessWidget {
  const ListSeparator({ super.key });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 0.5,
      indent: 8.0,
      endIndent: 8.0,
      height: 0,
    );
  }
}
