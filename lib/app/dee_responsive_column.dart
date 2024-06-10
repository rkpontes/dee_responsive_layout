import 'package:flutter/material.dart';

class DeeResponsiveColumn {
  final int sm;
  final int md;
  final int lg;
  final int xl;

  final Alignment alignment;
  final Widget child;

  DeeResponsiveColumn({
    required this.child,
    this.sm = 6,
    this.md = 8,
    this.lg = 10,
    this.xl = 12,
    this.alignment = Alignment.topLeft,
  });

  int getColSpan(double width) {
    if (width >= 1200) {
      return xl;
    } else if (width >= 992) {
      return lg;
    } else if (width >= 768) {
      return md;
    } else {
      return sm;
    }
  }
}
