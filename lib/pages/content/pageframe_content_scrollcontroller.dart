import 'package:flutter/material.dart';

class ScrollControllerProvider extends InheritedWidget {
  final ScrollController scrollController;

  const ScrollControllerProvider({ super.key,
    required super.child,
    required this.scrollController,
  });

  // Helper method to access the provider
  static ScrollControllerProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ScrollControllerProvider>();
  }

  @override
  bool updateShouldNotify(ScrollControllerProvider oldWidget) {
    return scrollController != oldWidget.scrollController;
  }
}
