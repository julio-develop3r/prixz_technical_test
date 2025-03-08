import 'package:json_annotation/json_annotation.dart';

part 'book.g.dart';

enum Filters { title, author }

@JsonSerializable()
class Book {
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

  @JsonKey(name: 'author_key')
  final List<String>? authorKey;
  @JsonKey(name: 'author_name')
  final List<String>? authorName;
  @JsonKey(name: 'cover_edition_key')
  final String? coverEditionKey;
  @JsonKey(name: 'cover_i')
  final int? coverI;
  @JsonKey(name: 'edition_count')
  final int? editionCount;
  @JsonKey(name: 'first_publish_year')
  final int? firstPublishYear;
  @JsonKey(name: 'has_fulltext')
  final bool? hasFulltext;
  final List<String>? ia;
  @JsonKey(name: 'ia_collection_s')
  final String? iaCollectionS;
  final String? key;
  final List<String>? language;
  @JsonKey(name: 'lending_edition_s')
  final String? lendingEditionS;
  @JsonKey(name: 'lending_identifier_s')
  final String? lendingIdentifierS;
  @JsonKey(name: 'public_scan_b')
  final bool? publicScanB;
  final String? title;
  final String? subtitle;
}
