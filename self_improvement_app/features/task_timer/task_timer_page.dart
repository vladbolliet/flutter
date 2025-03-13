import 'package:flutter/material.dart';

class TaskTimerPage extends StatefulWidget {
  @override
  TaskTimerPageState createState() => TaskTimerPageState();
}

class TaskTimerPageState extends State<TaskTimerPage> {

  bool _StartNewTaskIsExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Timer'),
        centerTitle: true,
        ),
      body: Stack(
        children: [
          Column(
            children: [
              // start new task button
              if(!_StartNewTaskIsExpanded) ... [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.3,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(fontSize: 24),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text("+ Start new task"),
                        ),
                        onPressed: () {
                          print("pressed new task button\n");
                          setState(() {
                            _StartNewTaskIsExpanded = true;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03,),
                  child: TextButton(
                    style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 24)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.edit, color: Colors.blue),
                          SizedBox(width: 8),
                          Text("Manual input"),
                        ]
                      ),
                    ),
                    onPressed: () {
                      print("pressed manual input button\n");
                      setState(() {
                        _StartNewTaskIsExpanded = true;
                      });
                    },
                  )
                )
              ]
              else ... [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.only(right: 20, bottom: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          textStyle: TextStyle(fontSize: 18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Back",
                            style: TextStyle(color: const Color.fromARGB(255, 93, 93, 93), fontSize: 18)
                          ),
                        ),
                        onPressed: () {
                          print("pressed back button\n");
                          setState(() {
                            _StartNewTaskIsExpanded = false;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: Duration(milliseconds: 500),
                  child: Padding(
                    padding: EdgeInsets.only(
                      //top: MediaQuery.of(context).size.height * 0.2,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 36, 36, 36), // Background color
                          borderRadius: BorderRadius.circular(16), // Rounded corners
                        ),
                        height: MediaQuery.of(context).size.height * 0.55,
                        width: MediaQuery.of(context).size.width * 0.85,
                      ),
                    ),
                  ),
                ),
              ],
              // end of the if statement
          ],),
        ],
      )
    );
  }
}
