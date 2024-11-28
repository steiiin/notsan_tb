import 'package:flutter/material.dart';

class HomeMenuItemModel {
  final String title;
  final Widget? target;
  final IconData icon;
  final bool isImportant;
  const HomeMenuItemModel({
    required this.title,
    required this.target,
    required this.icon,
    this.isImportant = false,
  });
}
