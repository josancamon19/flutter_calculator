import 'package:calculator/models/calculator_button.dart';
import 'package:flutter/material.dart';


class CalculatorLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              color: Colors.blueGrey.withOpacity(0.85),
              child: Row(
                children: <Widget>[
                  Text(
                    "",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w700,
                        fontSize: 48.0),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              child: Column(
                children: <Widget>[
                  buttonsByRow('C%</'),
                  buttonsByRow('789x'),
                  buttonsByRow('456-'),
                  buttonsByRow('123+'),
                  buttonsByRow('_0.='),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buttonsByRow(String row) {
    List<String> token = row.split("");
    return Expanded(
      flex: 1,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: token
              .map((e) =>
              CalculatorButton(e == '_' ? "+/-" : e == '<' ? '<=' : e))
              .toList()),
    );
  }
}

