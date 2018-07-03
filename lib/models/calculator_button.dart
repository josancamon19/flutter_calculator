import 'package:calculator/ui/calculator.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String keyValue;

  CalculatorButton(this.keyValue);

  @override
  Widget build(BuildContext context) {
    final MainState mainState = MainState.of(context);
    return Expanded(
      flex: 1,
      child: FlatButton(
          onPressed: () {
            mainState.onPressed(keyValue);
          },
          shape: Border.all(
              width: 2.0,
              color: Colors.grey.withOpacity(0.5),
              style: BorderStyle.solid),
          color: Colors.white,
          child: Text(
            keyValue,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 36.0,
                color: Colors.black54),
          )),
    );
  }
}
