import '../api/api.dart';
import '../models/api_response.dart';
import '../models/book.dart';

class BooksRepository {
  Future<List<Book>> fetchBooks(Filters filter, String query) async {
    final ApiResponse res = await Api().action(_parseParams('search.json', filter, query));
    return res.docs ?? <Book>[];
  }

  String _parseParams(String action, Filters filter, String query) {
    if (query.isEmpty) {
      return '$action?q=the+lord+of+the+rings';
    }

    if (filter == Filters.title) {
      return '$action?title=$query&limit=10';
    }

    return '$action?author=$query&limit=10';
  }
}
