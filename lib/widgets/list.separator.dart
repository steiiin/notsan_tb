// lib/pages/home/widgets/home.menu_item.dart

import 'package:flutter/material.dart';

class ListSeparator extends StatelessWidget {
  final double indentation;
  const ListSeparator({
    super.key,
    this.indentation = 8.0
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 0.5,
      indent: indentation,
      endIndent: indentation,
      height: 0,
    );
  }
}
