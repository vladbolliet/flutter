// filepath: d:\vlad\lib\features\task_timer\widgets\back_button.dart
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const BackButtonWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}