import 'package:flutter/material.dart';
import 'dart:async';

class TaskTimerPage extends StatefulWidget {
  @override
  TaskTimerPageState createState() => TaskTimerPageState();
}

class TaskTimerPageState extends State<TaskTimerPage> {
  bool _StartNewTaskIsExpanded = false;
  bool _ManualInputIsExpanded = false;
  String _currentScreen = ""; // Tracks which screen is currently displayed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Timer'), centerTitle: true),
      body: Stack(
        children: [
          Column(
            children: [
              if (!_StartNewTaskIsExpanded && !_ManualInputIsExpanded) ...[
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 24)),
                      child: Padding(padding: const EdgeInsets.all(16.0), child: Text("+ Start new task")),
                      onPressed: () {
                        setState(() {
                          _StartNewTaskIsExpanded = true;
                          _currentScreen = "Start new task";
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
                  child: TextButton(
                    style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 24)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.edit, color: Colors.blue), SizedBox(width: 8), Text("Manual input")],
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _ManualInputIsExpanded = true;
                        _currentScreen = "Manual input";
                      });
                    },
                  ),
                ),
              ] else ...[
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.only(right: 20, bottom: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 18)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Back",
                            style: TextStyle(color: Color.fromARGB(255, 93, 93, 93), fontSize: 18),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_StartNewTaskIsExpanded) _StartNewTaskIsExpanded = false;
                            if (_ManualInputIsExpanded) _ManualInputIsExpanded = false;
                          });

                          // Wait for the animation to finish before resetting _currentScreen
                          Future.delayed(Duration(milliseconds: 450), () {
                            setState(() {
                              _currentScreen = "";
                            });
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
          // Animated Box
          AnimatedPositioned(
            duration: Duration(milliseconds: 450),
            curve: Curves.easeInOut,
            top: (_StartNewTaskIsExpanded || _ManualInputIsExpanded) ? MediaQuery.of(context).size.height * 0.23 : MediaQuery.of(context).size.height,
            left: MediaQuery.of(context).size.width * 0.075,
            child: AnimatedOpacity(
              opacity: (_StartNewTaskIsExpanded || _ManualInputIsExpanded) ? 1.0 : 0.0,
              duration: Duration(milliseconds: 300),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 36, 36, 36),
                  borderRadius: BorderRadius.circular(16),
                ),
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  children: [
                    if (_currentScreen == "Start new task")
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04,
                          left: MediaQuery.of(context).size.width * 0.06,
                        ),
                        child: Column(children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 40.0),
                            child: Row(children: [ 
                              TextButton(
                                child: Text("Pomodoro", style: TextStyle(fontSize: 18)),
                                onPressed: () {print("pressed pomodoro");},
                              ),
                              TextButton(
                                child: Text("Stopwatch", style: TextStyle(fontSize: 18)),
                                onPressed: () {
                                  setState(() {
                                    _currentScreen = "Stopwatch";
                                  });
                                  print("pressed stopwatch");
                                },
                              ),
                            ],),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 18.0),
                            child: PomodoroTimer(),
                          ),
                        ],)
                      ), //end of if
                    if (_currentScreen == "Stopwatch")
                      StopwatchWidget(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StopwatchWidget extends StatefulWidget {
  @override
  _StopwatchWidgetState createState() => _StopwatchWidgetState();
}

class _StopwatchWidgetState extends State<StopwatchWidget> {
  late Stopwatch _stopwatch;
  Timer? _timer;

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
  }
}

void _pauseStopwatch() {
  if (_stopwatch.isRunning) {
    _stopwatch.stop();
    _timer?.cancel();
    setState(() {}); // Ensure UI updates when paused
  }
}

void _resetStopwatch() {
  _stopwatch.stop(); // Ensure it stops before resetting
  _stopwatch.reset();
  _timer?.cancel();
  setState(() {}); // Ensure UI updates when reset
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
          Text("Stopwatch", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 10),
          Text(_formatTime(_stopwatch.elapsedMilliseconds),
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _startStopwatch,
                child: Text("Start"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _pauseStopwatch,
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


class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  Duration _duration = Duration(minutes: 50);
  Duration _initialDuration = Duration(minutes: 50);
  Timer? _timer;
  bool _isRunning = false;

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_duration.inSeconds > 0) {
        setState(() => _duration -= Duration(seconds: 1));
      } else {
        timer.cancel();
        _isRunning = false;
      }
    });
    setState(() => _isRunning = true);
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _duration = _initialDuration;
      _isRunning = false;
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
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _isRunning ? null : _startTimer,
                child: Text("Start"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _isRunning ? _pauseTimer : null,
                child: Text("Pause"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: _resetTimer,
                child: Text("Reset"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
