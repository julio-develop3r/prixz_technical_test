import '../api/api.dart';
import '../models/api_response.dart';
import '../models/book.dart';

class BooksRepository {
  Future<List<Book>> fetchBooks(Filters filter, String query) async {
    final ApiResponse res = await Api().action(_parseParams('search.json', filter, query));
    return res.docs ?? <Book>[];
  }

  String _parseParams(String action, Filters filter, String query) {
    final String q = query.isNotEmpty ? query : 'J.R.R. Tolkien';

    if (filter == Filters.title) {
      return '$action?title=$q&limit=10';
    }

    return '$action?author=$q&limit=10';
  }
}
