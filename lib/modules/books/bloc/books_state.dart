part of 'books_bloc.dart';

class BooksState extends Equatable {
  const BooksState();

  @override
  List<Object> get props => <Object>[];
}

final class BooksInitial extends BooksState {
  const BooksInitial();
}

final class BooksLoading extends BooksState {
  const BooksLoading();
}

final class BooksLoaded extends BooksState {
  const BooksLoaded({required this.books, required this.filterBy, this.query = ''});

  final List<Book> books;
  final Filters filterBy;
  final String query;

  @override
  List<Object> get props => <Object>[books, filterBy, query];
}

final class BooksError extends BooksState {
  const BooksError();
}
