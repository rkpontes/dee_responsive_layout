import 'package:flutter/material.dart';
import 'dee_responsive_column.dart';

class DeeResponsiveLayout extends StatelessWidget {
  const DeeResponsiveLayout({super.key, required this.children});

  final List<DeeResponsiveColumn> children;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        int columns = _getColumnCount(screenWidth);

        return Wrap(
          children: _buildRows(columns, screenWidth),
        );
      },
    );
  }

  int _getColumnCount(double width) {
    if (width >= 1200) {
      return 12; // xl
    } else if (width >= 992) {
      return 10; // lg
    } else if (width >= 768) {
      return 8; // md
    } else if (width >= 576) {
      return 6; // sm
    } else {
      return 4; // xs
    }
  }

  List<Widget> _buildRows(int columns, double screenWidth) {
    List<Widget> rows = [];
    int currentColCount = 0;
    List<Widget> currentRowChildren = [];

    for (var col in children) {
      int colSpan = col.getColSpan(screenWidth);

      if (currentColCount + colSpan > columns) {
        rows.add(Row(
          crossAxisAlignment: _getRowAlignment(col.alignment),
          children: currentRowChildren,
        ));
        currentRowChildren = [];
        currentColCount = 0;
      }

      currentColCount += colSpan;
      currentRowChildren.add(
        Expanded(
          flex: colSpan,
          child: Padding(
            padding: EdgeInsets.zero,
            child: Align(
              alignment: col.alignment,
              child: col.child,
            ),
          ),
        ),
      );
    }

    if (currentRowChildren.isNotEmpty) {
      rows.add(Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: currentRowChildren,
      ));
    }

    return rows;
  }
}

CrossAxisAlignment _getRowAlignment(Alignment alignment) {
  if (alignment == Alignment.topLeft) {
    return CrossAxisAlignment.start;
  } else if (alignment == Alignment.topCenter) {
    return CrossAxisAlignment.start;
  } else if (alignment == Alignment.topRight) {
    return CrossAxisAlignment.start;
  } else if (alignment == Alignment.centerLeft) {
    return CrossAxisAlignment.center;
  } else if (alignment == Alignment.center) {
    return CrossAxisAlignment.center;
  } else if (alignment == Alignment.centerRight) {
    return CrossAxisAlignment.center;
  } else if (alignment == Alignment.bottomLeft) {
    return CrossAxisAlignment.end;
  } else if (alignment == Alignment.bottomCenter) {
    return CrossAxisAlignment.end;
  } else if (alignment == Alignment.bottomRight) {
    return CrossAxisAlignment.end;
  }

  return CrossAxisAlignment.start;
}
