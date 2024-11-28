import 'package:flutter/material.dart';

class ListSeparator extends StatelessWidget {

  final bool useSpace;
  const ListSeparator({ super.key,
    this.useSpace = false,
  });

  @override
  Widget build(BuildContext context) {
    return useSpace
      ? const SizedBox(
        height: 8.0,
      )
      : const Divider(
          thickness: 0.4,
          indent: 8.0,
          endIndent: 8.0,
          height: 8.0,
      );
  }
}
