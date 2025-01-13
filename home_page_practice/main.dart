//date: 11 Jan 2025
//new edit on 14 Jan 2025

import 'package:flutter/material.dart';
import 'constants/images.dart';  // For image paths
import 'constants/colors.dart';   // For color constants


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
              Padding(
                padding: EdgeInsets.only(left: 40, top: 100),
                child: Image.asset(codeimg)
              ),
              Padding(
                padding: const EdgeInsets.only(top: 610, left: 300),
                child: 
                  FloatingActionButton(
                    onPressed: (){ print("hello"); },
                    backgroundColor: bluegrey,
                    child: const Icon(Icons.add)
                  )
              ),
              const Center(
                child: Text(
                  "centered text",
                  style: TextStyle(
                      fontSize: 24
                  )
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
                  title: const Text('item 1'),
                  onTap:() => print("some text"),
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
