import 'package:flutter/material.dart';

/// A class representing a responsive column configuration.
class DeeResponsiveColumn {
  /// The number of columns to span on small screens.
  final int sm;

  /// The number of columns to span on medium screens.
  final int md;

  /// The number of columns to span on large screens.
  final int lg;

  /// The number of columns to span on extra large screens.
  final int xl;

  /// The alignment of the column.
  final Alignment alignment;

  /// The child widget.
  final Widget child;

  /// Creates a DeeResponsiveColumn with specified child, column spans and alignment.
  ///
  /// [sm] is the number of columns to span on small screens (default is 6).
  /// [md] is the number of columns to span on medium screens (default is 8).
  /// [lg] is the number of columns to span on large screens (default is 10).
  /// [xl] is the number of columns to span on extra-large screens (default is 12).
  /// [alignment] is the alignment of the widget within the column (default is Alignment.topLeft).
  /// [child] is the widget to be displayed inside the column.
  DeeResponsiveColumn({
    required this.child,
    this.sm = 6,
    this.md = 8,
    this.lg = 10,
    this.xl = 12,
    this.alignment = Alignment.topLeft,
  });

  /// Gets the number of columns to span based on the screen width.
  ///
  /// [width] is the width of the screen.
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
