import 'package:chakrasample/components/ring_animation_widget.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //childにChakraWidgetを入れるために背景はdecorationにしておく
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://images.unsplash.com/photo-1562832135-14a35d25edef?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1415&q=80"),
            fit: BoxFit.cover
          )
        ),
        child: RingAnimationWidget(),
      ),
    );
  }
}
