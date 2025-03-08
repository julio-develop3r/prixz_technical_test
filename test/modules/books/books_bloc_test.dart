import 'package:app/models/book.dart';
import 'package:app/modules/books/bloc/books_bloc.dart';
import 'package:app/repositories/books_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBooksRepository extends Mock implements BooksRepository {}

void main() {
  late BooksBloc booksBloc;
  late MockBooksRepository mockBooksRepo;

  setUp(() {
    mockBooksRepo = MockBooksRepository();
    booksBloc = BooksBloc(mockBooksRepo);
  });

  group(BooksBloc, () {
    test('initial state is [BooksLoaded]', () {
      expect(
        booksBloc.state,
        equals(const BooksLoaded(books: <Book>[], filterBy: Filters.title, query: '')),
      );
    });

    blocTest<BooksBloc, BooksState>(
      'emits [BooksLoaded] when FetchBooks is added and succeeds',
      seed: () => const BooksLoaded(books: <Book>[], filterBy: Filters.author, query: ''),
      setUp: () {
        when(
          () => mockBooksRepo.fetchBooks(Filters.author, any<String>()),
        ).thenAnswer((_) async => <Book>[]);
      },
      build: () => booksBloc,
      act: (BooksBloc bloc) => bloc.add(const FetchBooks()),
      expect: () => <TypeMatcher<BooksState>>[isA<BooksLoading>(), isA<BooksLoaded>()],
    );

    blocTest<BooksBloc, BooksState>(
      'emits [BooksLoaded] when SetFilterBy is added and succeeds',
      seed: () => const BooksLoaded(books: <Book>[], filterBy: Filters.author, query: ''),
      build: () => booksBloc,
      act: (BooksBloc bloc) => bloc.add(const SetFilterBy(Filters.title)),
      expect:
          () => <BooksLoaded>[
            const BooksLoaded(books: <Book>[], filterBy: Filters.title, query: ''),
          ],
    );
  });
}
