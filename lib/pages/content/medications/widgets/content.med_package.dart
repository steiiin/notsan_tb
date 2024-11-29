import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:notsan_tb/fonts/med_add_icons.dart';
import 'package:notsan_tb/models/content_medication.dart';

class ContentMedPackage extends StatelessWidget {

  final MedicationPackageType type;
  final String title;
  final String incredients;

  const ContentMedPackage({ super.key,
    required this.type,
    required this.title,
    required this.incredients,
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final mdBodyStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
      height: 1.1,
    );
    final mdCodeStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(
      height: 1.1,
      fontFamily: 'monospace',
    );

    const spacer = SizedBox(width: 8.0);

    final typeIcon = switch(type) {
      MedicationPackageType.singleAmpoule => MedAddIcons.singleAmpoule,
      MedicationPackageType.doubleAmpoule => MedAddIcons.doubleAmpoule,
      MedicationPackageType.singleVial => MedAddIcons.singleVial,
      MedicationPackageType.vialWithAmpoule => MedAddIcons.vialWithAmpoule,
      MedicationPackageType.spray => MedAddIcons.spray,
      MedicationPackageType.inhaler => MedAddIcons.inhaler,
      MedicationPackageType.suppository => MedAddIcons.suppository,
      MedicationPackageType.syringe => MedAddIcons.syringe,
    };

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
      child: Table(
      columnWidths: const {
        0: FixedColumnWidth(60.0),
        1: FlexColumnWidth(1),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            spacer,
            // Align(
            //   alignment: Alignment.center,
            //   child: IconButton(onPressed: () => {}, icon: Icon(Icons.settings)) /* implement multiple packages */
            // ),

            Row(
              children: [
                Icon(typeIcon, size: 32.0),
                spacer,
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: titleStyle, overflow: TextOverflow.ellipsis),
                    MarkdownBody(
                        data: incredients,
                        styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
                          p: mdBodyStyle,
                          code: mdCodeStyle,
                        ),
                        softLineBreak: true,
                      )
                  ],
                ),
)

              ],
            )

            // Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Row(children: [
            //       Icon(typeIcon, size: 18.0),
            //       Text(title, style: titleStyle)
            //     ]),
            //     Padding(
            //       padding: const EdgeInsets.only(left: 5.0),
            //       child: MarkdownBody(
            //         data: incredients,
            //         styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(
            //           p: mdBodyStyle,
            //           code: mdCodeStyle,
            //         ),
            //       )
            //     )
            //   ],
            // ),

          ],
        ),
      ],
    )
    );

  }

}
