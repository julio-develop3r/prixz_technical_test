import 'package:app/models/book.dart';
import 'package:app/repositories/books_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../book_details/book_details_page.dart';
import 'bloc/books_bloc.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('****************BooksPage');
    return BlocProvider<BooksBloc>(
      create: (_) => BooksBloc(BooksRepository())..add(const FetchBooks()),
      lazy: false, // ! quitarlo
      child: const _View(),
    );
  }
}

class _View extends StatelessWidget {
  const _View();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BooksBloc, BooksState>(
      builder: (_, BooksState state) {
        if (state is! BooksLoaded) {
          return const CircularProgressIndicator();
        }
        print('********* ${state.filterBy}');
        return Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  DropdownButton<Filters>(
                    value: state.filterBy,
                    items: const <DropdownMenuItem<Filters>>[
                      DropdownMenuItem<Filters>(value: Filters.title, child: Text('By title')),
                      DropdownMenuItem<Filters>(value: Filters.author, child: Text('By author')),
                    ],
                    onChanged: (Filters? value) {
                      context.read<BooksBloc>().add(SetFilterBy(value ?? Filters.title));
                    },
                  ),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Search',
                      ),
                      onChanged: (String value) {
                        context.read<BooksBloc>().add(FetchBooks(query: value));
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children:
                    state.books
                        .map(
                          (Book e) => ListTile(
                            title: Text('${e.title}'),
                            subtitle: Text('${e.authorName}'),
                            trailing: IconButton(
                              iconSize: 40,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) => BookDetailsPage(e),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.keyboard_arrow_right),
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
