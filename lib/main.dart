import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stopwatch App',
      home: StopWatch(),
    );
  }
}

class StopWatch extends StatefulWidget {
  @override
  _StopWatchState createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  Stopwatch _stopwatch = Stopwatch();
  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String formatTime() {
    return (_stopwatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
        ':' +
        (_stopwatch.elapsed.inMilliseconds % 1000 ~/ 10)
            .toString()
            .padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stopwatch'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              formatTime(),
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Start'),
                  onPressed: () {
                    _stopwatch.start();
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  child: Text('Stop'),
                  onPressed: () {
                    _stopwatch.stop();
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  child: Text('Reset'),
                  onPressed: () {
                    _stopwatch.reset();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
