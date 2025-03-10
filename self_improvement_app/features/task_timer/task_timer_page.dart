import 'package:flutter/material.dart';

class TaskTimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task Timer'),
        centerTitle: true,
        ),
      body: Column(
        children: [
          // start new task button
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
                  onPressed: () => print("pressed new task button\n"),
                ),
              ),
            ),
          ),
          // manual input button
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
              onPressed: () => print("pressed manual input button\n"),
            )
          )
      ],)
    );
  }
}
