//date: 15 Jan 2025

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{

  int typedNumber = 0;

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 26), // normal text
          labelLarge: TextStyle(color: Colors.white, fontSize: 35) // button text
          
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
          )
        )
      ),
      home: Scaffold(
        body: Stack(
          children: [
            // result
            Positioned(
              top: MediaQuery.of(context).size.height*0.28,
              left: 0,
              right:0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.10,
                child: Row(
                  children: [
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Text(
                        "$typedNumber",
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.white
                        )
                      )
                    )
                  ]
                )
              )
            ),
            // buttons

            Positioned( // first line
              top: MediaQuery.of(context).size.height*0.4,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.10,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFC0C0C0),
                      ),
                      child: TextButton(
                        child: Text("C", style: TextStyle(color: Colors.black)),
                        onPressed:() {
                          print("pressed C");
                          setState(() => typedNumber = 0);
                        }
                      )
                    ),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFffb536)
                      ),
                      child: TextButton(
                        child: Text(
                          "÷",
                          style: TextStyle(fontSize: 40)
                        ),
                        onPressed:() => print("pressed ÷"),
                      )
                    )
                  ]
                )
              )
            ),
            Positioned( //second line
              top: MediaQuery.of(context).size.height*0.52,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.10,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFF383838),
                      ),
                      child: TextButton(
                        child: Text("7"),
                        onPressed:() {
                          print("pressed 7");
                          setState(() => typedNumber = typedNumber * 10 + 7);
                        }
                      )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFF383838)
                      ),
                      child: TextButton(
                        child: Text(
                          "8",
                          style: TextStyle(fontSize: 40)
                        ),
                        onPressed:() {
                          print("pressed 8");
                          setState(() => typedNumber = typedNumber * 10 + 8);
                        }
                      )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFF383838),
                      ),
                      child: TextButton(
                        child: Text("9"),
                        onPressed:() {
                          print("pressed 9");
                          setState(() => typedNumber = typedNumber * 10 + 9);
                        }
                      )
                    ),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(right: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFffb536)
                      ),
                      child: TextButton(
                        child: Text(
                          "×",
                          style: TextStyle(fontSize: 40)
                        ),
                        onPressed:() => print("pressed ×"),
                      )
                    ),
                  ]
                )
              )
            ),
            Positioned( // third line 
              top: MediaQuery.of(context).size.height*0.64,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.10,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFF383838),
                      ),
                      child: TextButton(
                        child: Text("4"),
                        onPressed:() {
                          print("pressed 4");
                          setState(() => typedNumber = typedNumber * 10 + 4);
                        }
                      )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFF383838)
                      ),
                      child: TextButton(
                        child: Text(
                          "5",
                          style: TextStyle(fontSize: 40)
                        ),
                        onPressed:() {
                          print("pressed 5");
                          setState(() => typedNumber = typedNumber * 10 + 5);
                        }
                      )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFF383838),
                      ),
                      child: TextButton(
                        child: Text("6"),
                        onPressed:() {
                          print("pressed 6");
                          setState(() => typedNumber = typedNumber * 10 + 6);
                        }
                      )
                    ),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(right: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFffb536)
                      ),
                      child: TextButton(
                        child: Text(
                          "-",
                          style: TextStyle(fontSize: 40)
                        ),
                        onPressed:() => print("pressed -"),
                      )
                    ),
                  ]
                )
              )
            ),
            Positioned( // fourth line
              top: MediaQuery.of(context).size.height*0.76,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.10,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFF383838),
                      ),
                      child: TextButton(
                        child: Text("1"),
                        onPressed:() {
                          print("pressed 1");
                          setState(() => typedNumber = typedNumber * 10 + 1);
                        }
                      )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFF383838)
                      ),
                      child: TextButton(
                        child: Text(
                          "2",
                          style: TextStyle(fontSize: 40)
                        ),
                        onPressed:() {
                          print("pressed 2");
                          setState(() => typedNumber = typedNumber * 10 + 2);
                        }
                      )
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFF383838),
                      ),
                      child: TextButton(
                        child: Text("3"),
                        onPressed:() {
                          print("pressed 3");
                          setState(() => typedNumber = typedNumber * 10 + 3);
                        }
                      )
                    ),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(right: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFffb536)
                      ),
                      child: TextButton(
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 40)
                        ),
                        onPressed:() => print("pressed +"),
                      )
                    ),
                  ]
                )
              )
            ),
            Positioned( // fifth line
              top: MediaQuery.of(context).size.height*0.88,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height*0.10,
                child: Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.47,
                      margin: EdgeInsets.only(left: 8, right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFF383838),
                      ),
                      child: TextButton( // to do : put the 0 on the left side (while still being able to click on the entire container)
                        child: Text("0"),
                        onPressed:() => print("pressed 0"),
                      )
                    ),
                    Spacer(),
                    Container(
                      height: MediaQuery.of(context).size.height*0.85,
                      width: MediaQuery.of(context).size.width*0.21,
                      margin: EdgeInsets.only(right: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color: Color(0xFFffb536)
                      ),
                      child: TextButton(
                        child: Text(
                          "=",
                          style: TextStyle(fontSize: 40)
                        ),
                        onPressed:() => print("pressed ="),
                      )
                    )
                  ]
                )
              )
            ),
          ]
        )
      )
    );
  }
}