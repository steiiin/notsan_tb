import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class ContentPharmacokinetics extends StatelessWidget {

  final String onset;
  final String duration;

  const ContentPharmacokinetics({ super.key,
    required this.onset,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {

    const spacer = SizedBox(width: 8.0);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Table(
      columnWidths: const {
        0: FixedColumnWidth(120.0),
        1: FlexColumnWidth(1),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.schedule, size: 18.0),
                  spacer,
                  Text('Wirkbeginn:'),
                ],
              ),
            ),
            MarkdownBody(data: onset),
          ],
        ),
        TableRow(
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.timer, size: 18.0),
                  spacer,
                  Text('Wirkdauer:'),
                ],
              ),
            ),
            MarkdownBody(data: duration),
          ],
        ),
      ],
    )
    );

  }

}
