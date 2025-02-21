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
  int operation = 0; // -1 for none, 0 for equal, 1 for division, 2 for multiplication, 3 for substraction, 4 for addition
  int secondNumber = 0;
  double result = 0;

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
                        operation > 0 ? "$secondNumber" : (operation == -1 ? "$typedNumber" : "$result"),
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
                          setState(() {
                            result = 0;
                            typedNumber = 0;
                            operation = -1;
                          });
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
                        onPressed:() {
                          print("pressed ÷");
                          setState(() {
                            operation = 1;
                            secondNumber = 0;
                          });
                        }
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
                          setState(() {
                            if(operation > 0){
                              secondNumber = secondNumber * 10 + 7;
                            }
                            else{
                              typedNumber = typedNumber * 10 + 7;
                            }
                          });
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
                          setState(() {
                            if(operation > 0){
                              secondNumber = secondNumber * 10 + 8;
                            }
                            else{
                              typedNumber = typedNumber * 10 + 8;
                            }
                          });
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
                          setState(() {
                            if(operation > 0){
                              secondNumber = secondNumber * 10 + 9;
                            }
                            else{
                              typedNumber = typedNumber * 10 + 9;
                            }
                          });
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
                        onPressed:() {
                          print("pressed ×");
                          setState(() {
                            operation = 2;
                            secondNumber = 0;
                          });
                        }
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
                          setState(() {
                            if(operation > 0){
                              secondNumber = secondNumber * 10 + 4;
                            }
                            else{
                              typedNumber = typedNumber * 10 + 4;
                            }
                          });
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
                          setState(() {
                            if(operation > 0){
                              secondNumber = secondNumber * 10 + 5;
                            }
                            else{
                              typedNumber = typedNumber * 10 + 5;
                            }
                          });
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
                          setState(() {
                            if(operation > 0){
                              secondNumber = secondNumber * 10 + 6;
                            }
                            else{
                              typedNumber = typedNumber * 10 + 6;
                            }
                          });
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
                        onPressed:() {
                          print("pressed -");
                          setState(() {
                            operation = 3;
                            secondNumber = 0;
                          });
                        }
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
                          setState(() {
                            if(operation > 0){
                              secondNumber = secondNumber * 10 + 1;
                            }
                            else{
                              typedNumber = typedNumber * 10 + 1;
                            }
                          });
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
                          setState(() {
                            if(operation > 0){
                              secondNumber = secondNumber * 10 + 2;
                            }
                            else{
                              typedNumber = typedNumber * 10 + 2;
                            }
                          });
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
                          setState(() {
                            if(operation > 0){
                              secondNumber = secondNumber * 10 + 3;
                            }
                            else{
                              typedNumber = typedNumber * 10 + 3;
                            }
                          });
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
                        onPressed:() {
                          print("pressed +");
                          setState(() {
                            operation = 4;
                            secondNumber = 0;
                          });
                        }
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
                      child: TextButton(
                        child: Text("0"),
                        onPressed:() {
                          print("pressed 0");
                          setState(() {
                            if(operation > 0){
                              secondNumber = secondNumber * 10;
                            }
                            else{
                              typedNumber = typedNumber * 10;
                            }
                          });
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
                        child: Text("."),
                        onPressed:() => print("pressed ."),
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
                        onPressed:() {
                          print("pressed =");
                          setState(() {
                            if(operation == 4){
                              typedNumber += secondNumber;
                            }
                            else if (operation == 3){
                              typedNumber -= secondNumber;
                            }
                            else if (operation == 2){
                              typedNumber *= secondNumber;
                            }
                            else if (operation == 1){
                              result = typedNumber / secondNumber;
                            } // FIX THE DIVISION
                            if(operation != 1){
                              result = typedNumber/1;
                            }
                          });
                          operation = 0;
                        }
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