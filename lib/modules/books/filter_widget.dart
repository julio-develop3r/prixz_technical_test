import 'package:app/models/book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/books_bloc.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  Filters filterBy = Filters.title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(18))),
                hintText: 'Search',
                labelText: 'Search',
              ),
              onChanged: (String value) => context.read<BooksBloc>().add(FetchBooks(query: value)),
            ),
          ),
          const SizedBox(width: 8),
          DropdownButton<Filters>(
            value: filterBy,
            items: const <DropdownMenuItem<Filters>>[
              DropdownMenuItem<Filters>(value: Filters.title, child: Text('By title')),
              DropdownMenuItem<Filters>(value: Filters.author, child: Text('By author')),
            ],
            onChanged: (Filters? value) {
              setState(() {
                filterBy = value ?? Filters.title;
              });
              context.read<BooksBloc>().add(FetchBooks(filterBy: filterBy));
            },
          ),
        ],
      ),
    );
  }
}
