import 'package:app/models/book.dart';
import 'package:app/modules/book_details/book_details_page.dart';
import 'package:app/repositories/books_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'bloc/books_bloc.dart';
import 'filter_widget.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  static const String route = '/books';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BooksBloc>(
      create: (_) => BooksBloc(BooksRepository())..add(const FetchBooks()),
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          FilterWidget(), //
          SizedBox(height: 8),
          _ListWidget(),
        ],
      ),
    );
  }
}

class _ListWidget extends StatelessWidget {
  const _ListWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<BooksBloc, BooksState>(
        builder: (_, BooksState state) {
          if (state is BooksError) {
            return Center(child: Text('Error: ${state.error}'));
          }

          if (state is! BooksLoaded) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.books.isEmpty) {
            return const Center(child: Text('No results :('));
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: state.books.length,
            itemBuilder: (_, int index) => _BookWidget(state.books[index]),
          );
        },
      ),
    );
  }
}

class _BookWidget extends StatelessWidget {
  const _BookWidget(this.book);

  final Book book;

  @override
  Widget build(BuildContext context) {
    final String? imageUrl = book.getBookImageUrl();

    return Card(
      child: InkWell(
        onTap: () => context.push(BookDetailsPage.route, extra: book),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (imageUrl != null)
              Expanded(child: Image.network(imageUrl))
            else
              const Expanded(child: Icon(Icons.my_library_books_rounded, size: 60)),
            Text(
              '${book.title}',
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
            Text(
              book.getAuthorsNames(),
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
