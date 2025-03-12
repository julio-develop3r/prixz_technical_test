part of 'books_bloc.dart';

sealed class BooksState extends Equatable {
  const BooksState({this.query = '', this.filterBy = Filters.title});

  final String query;
  final Filters filterBy;

  @override
  List<Object> get props => <Object>[];
}

final class BooksLoading extends BooksState {
  const BooksLoading({required super.query, required super.filterBy});
}

final class BooksLoaded extends BooksState {
  const BooksLoaded({
    required this.books, //
    super.filterBy,
    super.query,
  });

  final List<Book> books;

  @override
  List<Object> get props => <Object>[books, filterBy, query];
}

final class BooksError extends BooksState {
  const BooksError({
    required this.error, //
    super.query,
    super.filterBy,
  });

  final String error;

  @override
  List<Object> get props => <Object>[error, query, filterBy];
}
