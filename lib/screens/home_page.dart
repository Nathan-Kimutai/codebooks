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
      body: Column(
        children: <Widget>[TopPart()],
      ),
    );
  }
}

final TextEditingController searchController = TextEditingController();

class TopPart extends StatefulWidget {
  @override
  _TopPartState createState() => _TopPartState();
}

class _TopPartState extends State<TopPart> {
  Widget _buildSearchBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 10.0),
        Container(
          margin: EdgeInsets.only(top: 0, left: 30, right: 30, bottom: 0),
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: searchController,
            keyboardType: TextInputType.text,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: 'Search books',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: TopClipper(),
          child: Container(
            height: 500,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xFF0050BC)),
            // color: Color(0xFF4CDEAF),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 80),
                  child: Text(
                    "Code Books",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "What would you like to read",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 30,
                ),
                _buildSearchBar(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
