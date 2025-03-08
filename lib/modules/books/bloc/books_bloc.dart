import 'package:app/models/book.dart';
import 'package:app/repositories/books_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'books_event.dart';
part 'books_state.dart';

EventTransformer<Event> debounceTime<Event>({
  Duration duration = const Duration(milliseconds: 150),
}) {
  return (Stream<Event> events, Stream<Event> Function(Event) mapper) =>
      events.debounceTime(duration).flatMap(mapper);
}

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc(this._booksRepo) : super(const BooksLoaded(filterBy: Filters.title, books: <Book>[])) {
    on<FetchBooks>(_onFetchBooks, transformer: debounceTime());
  }

  final BooksRepository _booksRepo;

  Future<void> _onFetchBooks(FetchBooks event, Emitter<BooksState> emit) async {
    final BooksLoaded st = state as BooksLoaded;

    try {
      emit(const BooksLoading());

      final Filters filter = event.filterBy ?? st.filterBy;
      final String query = event.query ?? st.query;
      final List<Book> books = await _booksRepo.fetchBooks(filter, query);

      emit(BooksLoaded(filterBy: filter, books: books, query: query));
    } catch (e) {
      print('Error fetching books: ${e.toString()}');
    }
  }
}
