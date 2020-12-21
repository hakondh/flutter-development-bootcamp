import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: Dices(),
      ),
    ),
  );
}

class Dices extends StatefulWidget {
  @override
  _DicesState createState() => _DicesState();
}

class _DicesState extends State<Dices> {
  int _number1 = 1;
  int _number2 = 1;

  void _generateNumbers() {
    setState(() {
      _number1 = Random().nextInt(6) + 1;
      _number2 = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                onPressed: () {
                  _generateNumbers();
                },
                child: Image.asset('images/dice$_number1.png'),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: () {
                  _generateNumbers();
                },
                child: Image.asset('images/dice$_number2.png'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
