import 'package:app/models/book.dart';
import 'package:flutter/material.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage(this.book, {super.key});

  static const String route = '/book-details';

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _BookInfoWidget(book),
              const SizedBox(height: 24),
              _ExtraInfoWidget(book),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Languages:', style: Theme.of(context).textTheme.bodyLarge),
              ),
              Align(alignment: Alignment.centerLeft, child: Text(book.language?.join(', ') ?? '')),
            ],
          ),
        ),
      ),
    );
  }
}

class _BookInfoWidget extends StatelessWidget {
  const _BookInfoWidget(this.book);

  final Book book;

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = book.getBookImageUrl();

    return Column(
      children: <Widget>[
        if (imageUrl != null) Image.network(imageUrl, height: 300),
        const SizedBox(height: 12),
        Text(
          book.title ?? '',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _ExtraInfoWidget extends StatelessWidget {
  const _ExtraInfoWidget(this.book);

  final Book book;

  @override
  Widget build(BuildContext context) {
    final String? authorImageUrl = book.getAuthorImageUrl();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          child: Column(
            children: <Widget>[
              Text('Authors:', style: Theme.of(context).textTheme.bodyLarge), //
              Text(
                book.getAuthorsNames(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              if (authorImageUrl != null)
                Image.network(authorImageUrl, height: 125)
              else
                const Icon(Icons.person, size: 125),
            ],
          ),
        ),
        const SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Edition count:', style: Theme.of(context).textTheme.bodyLarge),
            Text(
              '${book.editionCount}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            Text('First publish year', style: Theme.of(context).textTheme.bodyLarge),
            Text(
              '${book.firstPublishYear}',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
