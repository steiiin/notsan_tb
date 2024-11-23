// lib/models/indication.dart

class Contraindication {
  final String text;
  final ContraindicationType type;
  const Contraindication({
    required this.text,
    required this.type,
  });
}

enum ContraindicationType {
  intolerance,
  acute,
  chronic,
  pediatric,
}