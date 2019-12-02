import 'package:codebooks/service/get_new_books.dart';
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
        appBar: AppBar(
          title: Text("CODE BOOKS"),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: _books.map((book) => BookWidget(book)).toList(),
          ),
        ));
  }
}

class BookWidget extends StatelessWidget {
  final Book _books;
  BookWidget(this._books);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(_books.image),
      ),
      title: Text(_books.title),
      subtitle: Text(_books.subtitle),
    );
  }
}
