import 'package:flutter/material.dart';
import 'package:dee_responsive_layout/dee_responsive_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Dee Responsive Layout Example')),
        body: DeeResponsiveLayout(
          children: [
            DeeResponsiveColumn(
              sm: 6,
              md: 4,
              lg: 3,
              xl: 2,
              child: Container(color: Colors.red, height: 100),
            ),
            DeeResponsiveColumn(
              sm: 6,
              md: 4,
              lg: 3,
              xl: 2,
              child: Container(color: Colors.green, height: 100),
            ),
            DeeResponsiveColumn(
              sm: 12,
              md: 8,
              lg: 6,
              xl: 4,
              child: Container(color: Colors.blue, height: 100),
            ),
          ],
        ),
      ),
    );
  }
}
