import 'package:flutter/material.dart';
import 'widgets/start_new_task_button.dart';
import 'widgets/manual_input_button.dart';
import 'widgets/back_button.dart';
import 'widgets/pomodoro_timer.dart';
import 'widgets/stopwatch_widget.dart';
import 'widgets/activity_chooser.dart';

class TaskTimerPage extends StatefulWidget {
  @override
  TaskTimerPageState createState() => TaskTimerPageState();
}

class TaskTimerPageState extends State<TaskTimerPage> {
  bool _startNewTaskIsExpanded = false;
  bool _manualInputIsExpanded = false;
  String _currentScreen = ""; // Tracks the current screen
  bool _isPomodoroPaused = false; // Tracks if the Pomodoro timer is paused

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Timer'), centerTitle: true),
      body: Stack(
        children: [
          Column(
            children: [
              if (!_startNewTaskIsExpanded && !_manualInputIsExpanded) ...[
                StartNewTaskButton(
                  onPressed: () {
                    setState(() {
                      _startNewTaskIsExpanded = true;
                      _currentScreen = "Start new task";
                    });
                  },
                ),
                ManualInputButton(
                  onPressed: () {
                    setState(() {
                      _manualInputIsExpanded = true;
                      _currentScreen = "Manual input";
                    });
                  },
                ),
              ] else ...[
                BackButtonWidget(
                  onPressed: () {
                    setState(() {
                      if (_startNewTaskIsExpanded) _startNewTaskIsExpanded = false;
                      if (_manualInputIsExpanded) _manualInputIsExpanded = false;
                    });
                    Future.delayed(Duration(milliseconds: 450), () {
                      setState(() {
                        _currentScreen = "";
                      });
                    });
                  },
                ),
              ],
            ],
          ),
          AnimatedBox(
            isExpanded: _startNewTaskIsExpanded || _manualInputIsExpanded,
            currentScreen: _currentScreen,
            isPomodoroPaused: _isPomodoroPaused,
            onScreenChange: (newScreen) {
              setState(() {
                _currentScreen = newScreen;
              });
            },
            onPomodoroPause: () {
              setState(() {
                _isPomodoroPaused = true;
              });
            },
            onPomodoroResume: () {
              setState(() {
                _isPomodoroPaused = false;
              });
            },
          ),
        ],
      ),
    );
  }
}

class AnimatedBox extends StatefulWidget {
  final bool isExpanded;
  final String currentScreen;
  final bool isPomodoroPaused;
  final Function(String) onScreenChange;
  final VoidCallback onPomodoroPause;
  final VoidCallback onPomodoroResume;

  const AnimatedBox({
    required this.isExpanded,
    required this.currentScreen,
    required this.isPomodoroPaused,
    required this.onScreenChange,
    required this.onPomodoroPause,
    required this.onPomodoroResume,
  });

  @override
  AnimatedBoxState createState() => AnimatedBoxState();
}

class AnimatedBoxState extends State<AnimatedBox> {
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 450),
      curve: Curves.easeInOut,
      top: widget.isExpanded
          ? MediaQuery.of(context).size.height * 0.23
          : MediaQuery.of(context).size.height,
      left: MediaQuery.of(context).size.width * 0.075,
      child: AnimatedOpacity(
        opacity: widget.isExpanded ? 1.0 : 0.0,
        duration: Duration(milliseconds: 300),
        child: Container(
          decoration: BoxDecoration(
            color: widget.isPomodoroPaused
                ? Color.fromARGB(255, 67, 42, 4) // Orange when paused
                : Color.fromARGB(255, 36, 36, 36), // Default color
            borderRadius: BorderRadius.circular(16),
          ),
          height: MediaQuery.of(context).size.height * 0.55,
          width: MediaQuery.of(context).size.width * 0.85,
          child: Column(
            children: [
              if (widget.currentScreen == "Start new task") ...[
                SizedBox(height: MediaQuery.of(context).size.height * 0.13),
                TaskOptionButton(
                  label: "Pomodoro",
                  onPressed: () {
                    widget.onScreenChange("Pomodoro");
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                TaskOptionButton(
                  label: "Stopwatch",
                  onPressed: () {
                    widget.onScreenChange("Stopwatch");
                  },
                ),
              ] else if (widget.currentScreen == "Pomodoro") ...[
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ActivityChooser(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                PomodoroTimer(
                  onPause: widget.onPomodoroPause,
                  onResume: widget.onPomodoroResume,
                ),
              ] else if (widget.currentScreen == "Stopwatch") ...[
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                ActivityChooser(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                StopwatchWidget(),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class TaskOptionButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const TaskOptionButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0), // Add spacing between buttons
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue, // Button background color
          foregroundColor: Colors.white, // Text color
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
          ),
          elevation: 5, // Add shadow for a 3D effect
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20.0, // Larger font size for better readability
            fontWeight: FontWeight.bold, // Bold text
          ),
        ),
      ),
    );
  }
}