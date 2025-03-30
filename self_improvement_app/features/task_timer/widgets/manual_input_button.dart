// filepath: d:\vlad\lib\features\task_timer\widgets\manual_input_button.dart
import 'package:flutter/material.dart';

class ManualInputButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ManualInputButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
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
            ],
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}