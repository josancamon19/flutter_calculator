import 'package:calculator/ui/calculator_layout.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String inputString = "";
  double prevValue;
  String value = "";
  String op = "z ";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MainState(
      inputValue: inputString,
      prevValue: prevValue,
      value: value,
      op: op,
      onPressed:onPressed,
      child: CalculatorLayout(),
    );
  }
  bool isNumber(String str){
    if(str == null){
      return false;
    }
    return double.parse(str,(e)=>null)!=null;
  }
  void onPressed(keyValue){
    switch (keyValue) {
      case "C":
        op = null;
        prevValue = 0.0;
        value = "";
        setState(() => inputString = "");
        break;
      case ".":
      case "%":
      case "<=":
      case "+/-":
        break;
      case "x":
      case "+":
      case "-":
      case "/":
        op = keyValue;
        value = '';
        prevValue = double.parse(inputString);
        setState(() {
          inputString = inputString + keyValue;
        });
        break;
      case "=":
        if (op != null) {
          setState(() {
            switch (op) {
              case "x":
                inputString =
                    (prevValue * double.parse(value)).toStringAsFixed(0);
                break;
              case "+":
                inputString =
                    (prevValue + double.parse(value)).toStringAsFixed(0);
                break;
              case "-":
                inputString =
                    (prevValue - double.parse(value)).toStringAsFixed(0);
                break;
              case "/":
                inputString =
                    (prevValue / double.parse(value)).toStringAsFixed(2);
                break;
            }
          });
          op = null;
          prevValue = double.parse(inputString);
          value = '';
          break;
        }
        break;
      default:
        if (isNumber(keyValue)) {
          if (op != null) {
            setState(() => inputString = inputString + keyValue);
            value = value + keyValue;
          } else {
            setState(() => inputString = "" + keyValue);
            op = 'z';
          }
        } else {
          onPressed(keyValue);
        }
    }
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

  static MainState of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(MainState);
  }

  @override
  bool updateShouldNotify(MainState oldWidget) {
    return inputValue != oldWidget.inputValue;
  }
}
