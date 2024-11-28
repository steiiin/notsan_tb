import 'package:flutter/material.dart';

class TreatmentIcon extends StatelessWidget {

  const TreatmentIcon({ super.key });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.monitor_heart_outlined,
      color: Theme.of(context).iconTheme.color?.withOpacity(0.2),
    );
  }

}
