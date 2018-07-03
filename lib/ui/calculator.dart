import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String inputString = "";
  double prevValue;
  String value= "";
  String op= "z ";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}

class MainState extends InheritedWidget {
  MainState({
    Key key,
    this.inputValue,
    this.prevValue,
    this.value,
    this.op,
    this.onPressed,
    Widget child,
  }) : super(key: key, child: child);

  final String inputValue;
  final double prevValue;
  final String value;
  final String op;
  final Function onPressed;


  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
    // TODO: implement updateShouldNotify
  }
}
