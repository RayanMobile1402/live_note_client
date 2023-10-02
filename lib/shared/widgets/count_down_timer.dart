import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  final void Function() onTimerFinished;

  const CountDownTimer({required this.onTimerFinished, super.key});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {

  int _counter = 120;
  late int minutes;
  late int seconds;
  bool hasTimerStarted = false;
  final Duration oneSec = const Duration(seconds: 1);
  late Timer _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timer = Timer.periodic(oneSec, (final timer) {
      minutes = _counter ~/ 60;
      seconds = _counter % 60;
      hasTimerStarted = true;
      if (_counter > 0) {
        if (mounted) {
          setState(() {
            _counter--;
          });
        } else {
          _timer.cancel();
        }
      } else {
        widget.onTimerFinished.call();
        _timer.cancel();
      }
    });
  }

  @override
  Widget build(final BuildContext context) => hasTimerStarted
      ? Text(
          'Remaining Time ${minutes < 10 ? '0$minutes' : minutes} : ${seconds < 10 ? '0$seconds' : seconds}')
      : const SizedBox.shrink();
}
