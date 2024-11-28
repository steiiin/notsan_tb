import 'package:flutter/material.dart';

class CardExpander extends StatelessWidget {

  final String title;
  final Widget child;

  final bool initiallyExpanded;
  final Widget? icon;

  final ValueChanged<bool>? onExpansionChanged;

  const CardExpander({ super.key,
    required this.title,
    required this.child,

    this.initiallyExpanded = true,
    this.icon,

    this.onExpansionChanged,
  });

  void _ensureVisbility(BuildContext context, bool expanded) {
    if (onExpansionChanged != null) {
      onExpansionChanged?.call(expanded);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(

        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        leading: icon,

        onExpansionChanged: (expanded) => _ensureVisbility(context, expanded),

        shape: const Border(),
        collapsedShape: const Border(),
        initiallyExpanded: initiallyExpanded,

        children: [
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: child,
          )
        ],
      ),
    );
  }
}
