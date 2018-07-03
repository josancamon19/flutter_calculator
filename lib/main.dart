import 'package:calculator/ui/calculator_layout.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Calculator",
    home: CalculatorLayout(),
    theme: ThemeData(primarySwatch: Colors.blueGrey),
  ));
}
