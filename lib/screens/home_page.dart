import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CODE BOOKS"),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Container(
        height: 300,
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40))),
      ),
    );
  }
}
