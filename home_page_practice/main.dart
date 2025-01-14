//date: 11 Jan 2025

import 'package:flutter/material.dart';
import 'constants/images.dart';  // For image paths
import 'constants/colors.dart';   // For color constants


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: MyHomePage()
    );
  }
}

// MyHomePage Widget Class

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState() => _MyHomePageState(); 
}

//State for MyHomePage

class _MyHomePageState extends State<MyHomePage>{

  int _counter = 0; //counter
  bool _isSwitched = false; //for toggle
  bool _isDarkTheme = false; //for theme

  void _incrementCounter(){ //function for incrementing counter
    setState(() => _counter++);
  }

  ThemeData _lightTheme =  ThemeData(
    primaryColor: bluegrey,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(backgroundColor: bluegrey)
  );

  ThemeData _darkTheme =  ThemeData(
    primaryColor: bluegrey,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(backgroundColor: bluegrey)
  );

  // main function
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _isDarkTheme ? _darkTheme : _lightTheme,
      home: Scaffold(

        // app bar

        appBar: AppBar(
          title: const Text("practice"),
          backgroundColor: bluegrey,
          actions: [
            IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                print("star clicked");
              }
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print("search clicked");
              }
            ),
          ],
        ),

        // body

        body:
          Stack(
            children: [
              Switch(
                value: _isSwitched,
                onChanged: (v){
                  setState(() => _isSwitched = v);
                }
              ),
              if(_isSwitched)
                Padding(
                  padding: EdgeInsets.only(left: 40, top: 100),
                  child: Image.asset(codeimg)
                ),
              Column(
                children: [
                  SizedBox(height: 450),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: (){ _incrementCounter(); },
                        backgroundColor: bluegrey,
                        child: const Icon(Icons.add)
                      )
                    ]
                  )
                ]
              ),
              Padding(
                padding: EdgeInsets.only(top: 540, left: 105),
                child: Text(
                  "Counter value: $_counter",
                  style: TextStyle(
                      fontSize: 24
                  )
                )
              ),
              Padding(
                padding: EdgeInsets.only(top: 600, left: 130),
                child: ElevatedButton(
                  onPressed: () => setState(() => _counter = 0),
                  child: Text("Reset counter"),
                )
              )
            ]
          ),

        drawer: Drawer(
          child:
            ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  child: Text("test"),
                ),
                ListTile(
                  title: const Text('Switch to dark theme'),
                  onTap:() => setState(() =>_isDarkTheme = !_isDarkTheme), //switch
                ),
                ListTile(
                  title: const Text('item 2'),
                  onTap: () => print("some more text"),
                ),
                ListTile(
                  title: const Text('item 3'),
                  onTap: () => print("even more text"),
                )
              ]
            )
        )
      )
    );
  }
}