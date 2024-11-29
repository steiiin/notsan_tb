import 'package:flutter/material.dart';

class ListSeparator extends StatelessWidget {

  final bool useSpace;
  final bool noIndent;

  const ListSeparator({ super.key,
    this.useSpace = false,
    this.noIndent = false,
  });

  @override
  Widget build(BuildContext context) {
    return useSpace
      ? const SizedBox(
        height: 8.0,
      )
      : Divider(
        thickness: 0.4,
        indent: noIndent ? 0.0 : 8.0,
        endIndent: noIndent ? 0.0 : 8.0,
        height: 8.0,
      );
  }
}
