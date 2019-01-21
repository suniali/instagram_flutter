import 'package:flutter/material.dart';

import 'package:instagram_mine/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Instagram',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(context)=>MyHomePage(
          title: "Home",
        ),
      },
    );
  }
}


