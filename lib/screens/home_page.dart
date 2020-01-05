import 'package:carousel_slider/carousel_slider.dart';
import 'package:codebooks/service/get_new_books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
        title: Text("Code Books"),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "Code Books",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              decoration: BoxDecoration(color: Colors.green),
            ),
            ListTile(
              title: Text("About"),
              onTap: () {},
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              color: Colors.green,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Text("Codebooks",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 45,
                            color: Colors.white)),
                    Container(
                      height: 250,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _books.length,
                          itemBuilder: (BuildContext context, int index) {
                            var data = _books[index];
                            return Container(
                              margin: EdgeInsets.all(10.0),
                              height: 210,
                              width: 200,
                              child: Stack(
                                alignment: Alignment.topCenter,
                                children: <Widget>[
                                  Positioned(
                                    bottom: 10.0,
                                    child: Container(
                                      height: 120,
                                      width: 180,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: <Widget>[
                                            Text(
                                              data.title,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0.0, 2.0),
                                            blurRadius: 6.0,
                                          )
                                        ]),
                                    child: Stack(
                                      children: <Widget>[
                                        Image(
                                          height: 150.0,
                                          width: 150.0,
                                          image: NetworkImage(data.image),
                                          fit: BoxFit.cover,
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              )),
          Container(
            height: MediaQuery.of(context).size.height - 300,
            child: ListView.builder(
                itemCount: _books.length,
                itemBuilder: (BuildContext context, int index) {
                  var book = _books[index];
                  String subtitle = book.subtitle.length > 60
                      ? book.subtitle.substring(0, 60)
                      : book.subtitle;
                  String title = book.title.length > 45
                      ? book.title.substring(0, 45)
                      : book.title;
                  return _buildCard(title, subtitle, book.price, book.image);
                }),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String subtitle, String price, String image) {
    return GestureDetector(
      onTap: () {
        print("Tapped");
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Container(
          decoration: BoxDecoration(),
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.network(image),
              Padding(
                padding: EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        price.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 200,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.clip,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 240,
                        child: Text(
                          subtitle,
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.clip,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Icon(
                  Icons.navigate_next,
                  size: 30,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
