import 'package:carousel_slider/carousel_slider.dart';
import 'package:codebooks/service/get_new_books.dart';
import 'package:codebooks/utils/styles.dart';
import 'package:codebooks/utils/top_clipper.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> _books = <Book>[];

  @override
  void initState() {
    super.initState();
    listenForBooks();
  }

  listenForBooks() async {
    var streams = await getBooks();
    streams.listen((book) => setState(() => _books.add(book)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search books",
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CarouselSlider(
              height: 300,
              items: _books.map((i) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(i.title),
                  );
                });
              }).toList(),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Bestsellers",
                    style: TextStyle(fontSize: 18, color: Colors.blueGrey),
                  ),
                  Text(
                    "View more",
                    style: TextStyle(fontSize: 14.0, color: Colors.blue),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0),
            CarouselSlider(
              height: 150,
              items: _books.map((f) {
                return Builder(builder: (BuildContext context) {
                  return Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        color: Colors.green,
                      ),
                      Text(
                        f.title,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  );
                });
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
