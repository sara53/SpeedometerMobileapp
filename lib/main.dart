import 'package:flutter/material.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Connected Car Task',
      theme: ThemeData(
        fontFamily: 'Changa'
      ),
      home:MyHomePage(),
      debugShowCheckedModeBanner: false,

    );
  }
}


