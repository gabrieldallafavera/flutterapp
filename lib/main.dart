import 'package:appflutter/screens/inicial.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)
            .copyWith(secondary: Colors.orange[600], onSecondary: Colors.white),
        // buttonTheme: ButtonThemeData(
        //   buttonColor: Colors.deepOrange[800],
        //   textTheme: ButtonTextTheme.primary,
        // ),
      ),
      home: Inicial(),
    );
  }
}

// To do

// Sliver App Bar
//
// Animated Icon Button
//
// Laucher Icon
