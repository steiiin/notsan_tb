// lib/pages/home/widgets/home.menu_item.dart

import 'package:flutter/material.dart';
import 'package:notsan_tb/models/home_item.dart';

class HomeMenuItem extends StatelessWidget {
  final HomeMenuItemModel item;
  final bool isImportant;
  final GestureTapCallback? onTap;

  const HomeMenuItem({
    super.key,
    required this.item,
    this.isImportant = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minTileHeight: 64.0,
      leading: Icon(
        item.icon,
        color: isImportant ? const Color(0xFFFF0000) : null,
      ),
      title: Text(
        item.title,
        style: TextStyle(
          color: isImportant ? const Color(0xFFFF0000) : null,
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: onTap,
    );
  }
}
