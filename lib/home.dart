import 'package:flutter/material.dart';
import 'Time/MyTimer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Simple Timer"),
        ),
        body: Column(
          children: <Widget>[
            MyTimer(),
          ],
        ),
    );
  }
}