import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.red,
            body: SafeArea(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.white,
                  child: Text('Container 1'),
                  height: 100,
                  width: 100,
                ),
                Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: Text('Container 2')),
                Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                    child: Text('Container 3'))
              ],
            ))));
  }
}
