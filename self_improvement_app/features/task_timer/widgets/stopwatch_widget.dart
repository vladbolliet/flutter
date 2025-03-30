import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchWidget extends StatefulWidget {
  @override
  _StopwatchWidgetState createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  late Stopwatch _stopwatch;
  Timer? _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _timer?.cancel(); // Cancel any existing timer
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {});
      });
      setState(() => _isRunning = true);
    }
  }

  void _pauseStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer?.cancel();
      setState(() => _isRunning = false); // Ensure UI updates when paused
    }
  }

  void _resetStopwatch() {
    _stopwatch.stop(); // Ensure it stops before resetting
    _stopwatch.reset();
    _timer?.cancel();
    setState(() => _isRunning = false); // Ensure UI updates when reset
  }

  String _formatTime(int milliseconds) {
    int hours = (milliseconds ~/ 3600000) % 60;
    int minutes = (milliseconds ~/ 60000) % 60;
    int seconds = (milliseconds ~/ 1000) % 60;
    return '${hours.toString().padLeft(2, '0')}:''${minutes.toString().padLeft(2, '0')}:''${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(height: 10),
          Text(
            _formatTime(_stopwatch.elapsedMilliseconds),
            style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isRunning ? null : _startStopwatch,
                child: Text("Start"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _isRunning ? _pauseStopwatch : null,
                child: Text("Pause"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _resetStopwatch,
                child: Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
