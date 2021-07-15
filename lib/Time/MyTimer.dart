import 'package:flutter/material.dart';
import 'dart:async';

class MyTimer extends StatefulWidget {
  MyTimer({Key? key}) : super(key: key);

  @override
  _MyTimerState createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  var visualTimer;
  Timer? timer;
  int innerTimer = 0;
  int goalTimer = 120;

  initState() {
    super.initState();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (innerTimer <= goalTimer) {
        setState(() {
          innerTimer++;
          visualTimer = prettyTime(( innerTimer));
        });
      } else {
        stopTimer();
      }
    });
  }

  prettyTime(int time) {
    int minutes = (time / 60).floor();
    var seconds = ((time % 60)-60)*-1;
    String union = minutes > 0 ? (minutes - 1).toString():minutes.toString()
    +":"+ 
    seconds.toStringAsFixed(0);
    return union;
  }

  void stopTimer() {
    timer?.cancel();
  }

  void resetTimer() {
    setState(() {
      visualTimer = null;
      innerTimer = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(visualTimer != null ? '$visualTimer' : 'Waiting',
                style: TextStyle(fontSize: 32)),
            TextButton(onPressed: startTimer, child: Text("Start")),
            TextButton(onPressed: stopTimer, child: Text("Stop")),
            TextButton(onPressed: resetTimer, child: Text("Restart")),
          ],
        ),
      ),
    );
  }
}
