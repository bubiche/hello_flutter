import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'dart:async';
import 'utils.dart';

void main() => runApp(TimeKillerApp());

class TimeKillerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waste Your Time',
      home: TimeKillerPage(),
    );
  }
}

class TimeKillerPage extends StatefulWidget {
  @override
  TimeKillerState createState() => TimeKillerState();
}

class TimeKillerState extends State<TimeKillerPage> {
  int _counter = 0;
  final buttonCounterTextStyle = new TextStyle(
    fontSize: 28.0,
    color: appTextColor,
  );

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(30.0),
              child: AutoSizeText(
                  _counter > 1 ? 'Button is pushed $_counter times' : 'Button is pushed $_counter time',
                  style: buttonCounterTextStyle,
                  maxLines: 1,
              )
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TimerText(),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Container(
                height: 80.0,
                width: 80.0,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: _incrementCounter,
                    child: Icon(Icons.child_care),
                    backgroundColor: appButtonColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TimerText extends StatefulWidget {
  @override
  TimerState createState() => TimerState();
}

class TimerState extends State<TimerText> {
  final _stopwatch = new Stopwatch()..start();
  final timerTextStyle = new TextStyle(
    fontSize: 28.0,
    color: appTextColor,
  );
  Timer _timer;

  TimerState() {
    _timer = new Timer.periodic(new Duration(milliseconds: 40), timerCallback);

    if (!kReleaseMode) {
      // DEBUG only: check if _timer is active
      print(_timer.isActive);
    }
  }

  void timerCallback(Timer timer) {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedTime = TimerTextFormatter.format(_stopwatch.elapsedMilliseconds);
    return new AutoSizeText(
        'You have wasted: $formattedTime',
        style: timerTextStyle,
        maxLines: 1,
    );
  }
}