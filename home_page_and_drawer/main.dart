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

        // app bar

        appBar: AppBar(title: Text("practice"), backgroundColor: Colors.blueGrey),

        //body

        body:
          Padding(
            padding: EdgeInsets.only(top: 610, left: 300),
            child: 
              FloatingActionButton(
                onPressed: (){ print("helloo"); },
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.add)
              )
          ),

        drawer: Drawer(
          child:
            ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Text("test"),
                ),
                ListTile(
                  title: Text('item 1'),
                  onTap:() => print("some text"),
                ),
                ListTile(
                  title: Text('item 2'),
                  onTap: () => print("some more text"),
                ),
                ListTile(
                  title: Text('item 3'),
                  onTap: () => print("even more text"),
                )
              ]
            )
        )
      )
    );
  }
}
