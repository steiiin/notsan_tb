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
      ContentMedDosageTarget.senior => Colors.orange,
      ContentMedDosageTarget.youth => Colors.lightGreen,
      ContentMedDosageTarget.child => Colors.red,
      ContentMedDosageTarget.infant => Colors.purple,
      ContentMedDosageTarget.baby => Colors.pink,
      _ => baseColor,
    };
    final targetText = ownTarget ?? switch(target) {
      ContentMedDosageTarget.adult => 'ERWACHSENE',
      ContentMedDosageTarget.senior => 'SENIOREN',
      ContentMedDosageTarget.youth => 'JUGENDLICH',
      ContentMedDosageTarget.child => 'KINDER',
      ContentMedDosageTarget.infant => 'KLEINKIND',
      ContentMedDosageTarget.baby => 'BABY',
      _ => '',
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

    final hideTarget = target == ContentMedDosageTarget.none;
    final dosageText = Expanded(child:
      Text(dosage, style: dosageStyle, overflow: TextOverflow.ellipsis)
    );

    final finalWidget = hideTarget
    ? dosageText
    : Row(
        children: [
          SizedBox(
            width: 100.0,
            child: Text(targetText, style: targetStyle),
          ),
          dosageText
        ],
      );

    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: finalWidget
    );

  }

}

enum ContentMedDosageTarget {
  none,
  adult,
  senior,
  youth,
  child,
  infant,
  baby,
}