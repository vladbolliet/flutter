import 'package:flutter/material.dart';
import 'package:vlad/features/task_timer/task_timer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF121212), // Background color
        colorScheme: const ColorScheme.dark(
          primary: Colors.blueAccent,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: TaskTimerPage(),
    );
  }
}
