import 'package:app/models/book.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage(this.book, {super.key});

  static const String route = '/book-details';

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('${book.title}')), body: Text(book.toString()));
  }
}
