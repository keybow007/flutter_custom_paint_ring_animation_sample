import 'package:chakrasample/screens/home_screen.dart';
import 'package:flutter/material.dart';
//これいる
import 'dart:math';


/*
*   Chakra Animation
*   https://codepen.io/tahatesser/pen/GRpqbRY
* */

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ChakraSample",
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
