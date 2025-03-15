import 'package:flutter/material.dart';

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
                    Text(
                      _currentScreen,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
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
