import 'package:flutter/material.dart';
import 'dart:async';

class PomodoroTimer extends StatefulWidget {
  final VoidCallback onPause; // Add a callback for pause
  final VoidCallback onResume; // Callback for resume
  final VoidCallback onInitialState; // Callback for reset
  const PomodoroTimer({required this.onPause, required this.onResume, required this.onInitialState});
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  Duration _duration = Duration(minutes: 50);
  Duration _initialDuration = Duration(minutes: 50);
  Timer? _timer;
  bool _isRunning = false;
  bool _hasStarted = false;  // Flag to track if the timer has ever been started

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_duration.inSeconds > 0) {
        setState(() => _duration -= Duration(seconds: 1));
      } else {
        timer.cancel();
        setState(() {
          _isRunning = false;
        });
      }
    });
    setState(() {
      _isRunning = true;
      _hasStarted = true;  // Timer has started
    });
    widget.onResume(); // Notify parent when resumed
    print("Timer started: onResume called"); // Debug print
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
    widget.onPause(); // Notify parent when paused
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _duration = _initialDuration;
      _isRunning = false;
      _hasStarted = false;  // Reset the started flag
      widget.onResume(); // Notify parent when reset
      widget.onInitialState(); // Notify parent when reset
    });
  }

  void _setTime() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController minutesController = TextEditingController();
        return AlertDialog(
          title: Text("Set Timer"),
          content: TextField(
            controller: minutesController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: "Enter minutes"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                int? minutes = int.tryParse(minutesController.text);
                if (minutes != null && minutes > 0) {
                  setState(() {
                    _duration = Duration(minutes: minutes);
                    _initialDuration = _duration;
                  });
                }
                Navigator.pop(context);
              },
              child: Text("Set"),
            ),
          ],
        );
      },
    );
  }

  String _formatTime() {
    int minutes = _duration.inMinutes;
    int seconds = _duration.inSeconds.remainder(60);
    return "$minutes:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _setTime,
            child: Text(
              _formatTime(),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_isRunning) ...[
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: _pauseTimer,
                    child: Icon(Icons.pause, size: 20, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: _resetTimer,
                    child: Icon(Icons.logout, size: 20, color: Colors.white),
                  ),
                ),
              ] else ...[
                // Show PLAY button only if the timer has not started yet
                if (!_hasStarted) ... [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      onPressed: _startTimer,
                      child: Icon(Icons.play_arrow, size: 20, color: Colors.white),
                    ),
                  )
                ]
                else ... [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(112, 78, 0, 1)),
                      ),
                      onPressed: _startTimer,
                      child: Icon(Icons.play_arrow, size: 20, color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 8),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color.fromRGBO(112, 78, 0, 1)), 
                      ),
                      onPressed: _resetTimer,
                      child: Icon(Icons.logout, size: 20, color: Colors.white),
                    ),
                  )
                ],
              ],
            ],
          ),
        ],
      ),
    );
  }
}