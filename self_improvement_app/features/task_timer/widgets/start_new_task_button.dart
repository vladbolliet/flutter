// filepath: d:\vlad\lib\features\task_timer\widgets\start_new_task_button.dart
import 'package:flutter/material.dart';

class StartNewTaskButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartNewTaskButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3),
      child: Align(
        alignment: Alignment.center,
        child: TextButton(
          style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 24)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("+ Start new task"),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}