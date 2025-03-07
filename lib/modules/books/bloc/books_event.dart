part of 'books_bloc.dart';

sealed class BooksEvent extends Equatable {
  const BooksEvent();

  @override
  List<Object> get props => <Object>[];
}

class FetchBooks extends BooksEvent {
  const FetchBooks({this.query = ''});

  final String query;

  @override
  List<Object> get props => <Object>[query];
}

class SetFilterBy extends BooksEvent {
  const SetFilterBy(this.value);

  final Filters value;

  @override
  List<Object> get props => <Object>[value];
}
