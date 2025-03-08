import 'package:app/models/book.dart';
import 'package:app/repositories/books_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

part 'books_event.dart';
part 'books_state.dart';

EventTransformer<Event> debounceTime<Event>({
  Duration duration = const Duration(milliseconds: 400),
}) {
  return (Stream<Event> events, Stream<Event> Function(Event) mapper) =>
      events.debounceTime(duration).flatMap(mapper);
}

enum Filters { title, author }

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc(this._booksRepo)
    : super(const BooksLoaded(filterBy: Filters.title, query: '', books: <Book>[])) {
    on<FetchBooks>(_onFetchBooks, transformer: debounceTime());
    on<SetFilterBy>(_onSetFilterBy);
  }

  final BooksRepository _booksRepo;

  Future<void> _onFetchBooks(FetchBooks event, Emitter<BooksState> emit) async {
    final BooksLoaded st = state as BooksLoaded;

    try {
      emit(const BooksLoading());
      final List<Book> books = await _booksRepo.fetchBooks(st.filterBy, event.query);
      emit(BooksLoaded(filterBy: st.filterBy, query: st.query, books: books));
    } catch (e) {
      print('Error fetching books: ${e.toString()}');
    }
  }

  void _onSetFilterBy(SetFilterBy event, Emitter<BooksState> emit) {
    final BooksLoaded st = state as BooksLoaded;

    emit(st.copyWith(filterBy: event.value));
  }
}
