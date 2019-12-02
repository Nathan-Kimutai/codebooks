class Book {
  String title;
  String subtitle;
  String isbn;
  String price;
  String image;
  String url;

  Book(
      {this.title, this.subtitle, this.isbn, this.price, this.image, this.url});

  factory Book.fromJson()
}
