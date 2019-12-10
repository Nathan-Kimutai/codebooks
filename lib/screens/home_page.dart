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
      appBar: AppBar(title: Text("code books")),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.orange,
          ),
          ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Text("Hello");
              })
        ],
      ),
    );
  }
}
