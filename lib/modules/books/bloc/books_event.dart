part of 'books_bloc.dart';

sealed class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object?> get props => <Object>[];
}

class FetchBooks extends BooksEvent {
  const FetchBooks({this.filterBy, this.query});

  final Filters? filterBy;
  final String? query;

  @override
  List<Object?> get props => <Object?>[filterBy, query];
}
