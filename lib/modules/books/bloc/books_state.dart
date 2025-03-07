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
  const BooksLoaded({required this.books, required this.filterBy, required this.query});

  final List<Book> books;
  final Filters filterBy;
  final String query;

  BooksState copyWith({Filters? filterBy, String? query}) {
    return BooksLoaded(
      filterBy: filterBy ?? this.filterBy,
      query: query ?? this.query,
      books: books,
    );
  }

  @override
  List<Object> get props => <Object>[books, filterBy];
}

final class BooksError extends BooksState {
  const BooksError();
}
