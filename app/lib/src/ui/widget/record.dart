import 'dart:async';
import 'package:app/src/utils/time_format.dart';
import 'package:flutter/material.dart';

int total = 0;
int minute = 0;
int second = 0;
late Stopwatch stopwatch;

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  @override
  void initState() {
    super.initState();
    stopwatch = Stopwatch();
    stopwatch.reset();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: Stream<dynamic>.periodic(const Duration(milliseconds: 100)),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        total = (stopwatch.elapsedMilliseconds / 1000).floor();
        minute = total ~/ 60;
        second = total % 60;
        return Text(
          "${timeFormat(minute)}:${timeFormat(second)}",
          textScaleFactor: 1.5,
        );
      },
    );
  }
}
