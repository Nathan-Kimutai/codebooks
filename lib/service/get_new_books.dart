import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
import 'dart:convert';

var api = "https://api.itbook.store/1.0/new";

main() {
  getBooks();
}

class Book {
  final String title;
  final String subtitle;
  final String isbn;
  final String price;
  final String image;
  final String url;

  Book.fromJson(Map json)
      : title = json['title'],
        subtitle = json['subtitle'],
        isbn = json['isbn'],
        price = json['price'],
        image = json['image'],
        url = json['url'];

  String toString() => "Book: $title";
}

Future<Stream<Book>> getBooks() async {
  var client = new http.Client();
  var streamRes = await client.send(http.Request('get', Uri.parse(api)));

  return streamRes.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .expand((jsonBody) => (jsonBody as Map)['books'])
      .map((jsonPlace) => new Book.fromJson(jsonPlace));
}
