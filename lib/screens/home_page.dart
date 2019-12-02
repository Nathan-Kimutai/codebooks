import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _places = <String>[];

  @override
  void initState() {
    super.initState();
    _places = List.generate(100, (i) => 'Book $i');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("CODE BOOKS"),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: _places.map((place) => Text(place)).toList(),
          ),
        ));
  }
}
