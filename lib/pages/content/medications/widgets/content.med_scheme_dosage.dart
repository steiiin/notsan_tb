import 'package:flutter/material.dart';

class MedSchemeDosage extends StatelessWidget {

  final ContentMedDosageTarget target;
  final String dosage;

  final String? ownTarget;
  final Color? ownColor;

  const MedSchemeDosage(this.dosage, { super.key,
    this.target = ContentMedDosageTarget.adult,
    this.ownTarget,
    this.ownColor,
  });

  Color getMixedAccent(BuildContext context, Color base, Color accent) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final double factor = isDark ? 0.3 : 0.7;
    return Color.lerp(base, accent, factor)!;
  }

  @override
  Widget build(BuildContext context) {

    final baseColor = Theme.of(context).colorScheme.onSurface;

    final targetColor = ownColor ?? switch(target) {
      ContentMedDosageTarget.adult => Colors.blue,
    };
    final targetText = ownTarget ?? switch(target) {
      ContentMedDosageTarget.adult => 'ERWACHSENE',
    };
    final targetStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: getMixedAccent(context, baseColor, targetColor)
    );

    final dosageStyle = targetStyle?.copyWith(
      fontWeight: FontWeight.w900,
      fontFamily: 'Inconsolata',
    );

    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 100.0,
            child: Text(targetText, style: targetStyle),
          ),
          Expanded(child:
            Text(dosage, style: dosageStyle, overflow: TextOverflow.ellipsis)
          ),
        ],
      )
    );

  }

}

enum ContentMedDosageTarget {
  adult,
}