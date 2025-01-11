//date: 11 Jan 2025

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: 
          Center(
            child: 
              ElevatedButton(onPressed: () {print("i got pressed :)\n");}, child: Text("this is a button"))
          )
      )
    );
  }
}
