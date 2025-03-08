import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

enum Filters { title, author }

abstract interface class IBook {
  List<String>? get authorKey;
  List<String>? get authorName;
  String? get coverEditionKey;
  int? get coverI;
  int? get editionCount;
  int? get firstPublishYear;
  bool? get hasFulltext;
  List<String>? get ia;
  String? get iaCollectionS;
  String? get key;
  List<String>? get language;
  String? get lendingEditionS;
  String? get lendingIdentifierS;
  bool? get publicScanB;
  String? get title;
  String? get subtitle;
}

@JsonSerializable()
class Book implements IBook {
  Book({
    this.authorKey,
    this.authorName,
    this.coverEditionKey,
    this.coverI,
    this.editionCount,
    this.firstPublishYear,
    this.hasFulltext,
    this.ia,
    this.iaCollectionS,
    this.key,
    this.language,
    this.lendingEditionS,
    this.lendingIdentifierS,
    this.publicScanB,
    this.title,
    this.subtitle,
  });

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  Map<String, dynamic> toJson() => _$BookToJson(this);

  @override
  @JsonKey(name: 'author_key')
  final List<String>? authorKey;

  @override
  @JsonKey(name: 'author_name')
  final List<String>? authorName;

  @override
  @JsonKey(name: 'cover_edition_key')
  final String? coverEditionKey;

  @override
  @JsonKey(name: 'cover_i')
  final int? coverI;

  @override
  @JsonKey(name: 'edition_count')
  final int? editionCount;

  @override
  @JsonKey(name: 'first_publish_year')
  final int? firstPublishYear;

  @override
  @JsonKey(name: 'has_fulltext')
  final bool? hasFulltext;

  @override
  final List<String>? ia;

  @override
  @JsonKey(name: 'ia_collection_s')
  final String? iaCollectionS;

  @override
  final String? key;

  @override
  final List<String>? language;

  @override
  @JsonKey(name: 'lending_edition_s')
  final String? lendingEditionS;

  @override
  @JsonKey(name: 'lending_identifier_s')
  final String? lendingIdentifierS;

  @override
  @JsonKey(name: 'public_scan_b')
  final bool? publicScanB;

  @override
  final String? title;

  @override
  final String? subtitle;

  String getAuthorsNames() {
    final List<String> authors = authorName ?? <String>[];

    if (authors.isEmpty) {
      return 'N/A';
    }

    return authors.join(', ');
  }

  String? getBookImageUrl() {
    if (coverI == null) {
      return null;
    }

    return 'https://covers.openlibrary.org/b/id/$coverI-M.jpg';
  }

  String? getAuthorImageUrl() {
    final String? key = authorKey?.first;

    if (key == null) {
      return null;
    }

    return 'https://covers.openlibrary.org/a/olid/$key-M.jpg';
  }
}
