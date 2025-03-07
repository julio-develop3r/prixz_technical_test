// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) => Book(
  authorKey:
      (json['author_key'] as List<dynamic>?)?.map((e) => e as String).toList(),
  authorName:
      (json['author_name'] as List<dynamic>?)?.map((e) => e as String).toList(),
  coverEditionKey: json['cover_edition_key'] as String?,
  coverI: (json['cover_i'] as num?)?.toInt(),
  editionCount: (json['edition_count'] as num?)?.toInt(),
  firstPublishYear: (json['first_publish_year'] as num?)?.toInt(),
  hasFulltext: json['has_fulltext'] as bool?,
  ia: (json['ia'] as List<dynamic>?)?.map((e) => e as String).toList(),
  iaCollectionS: json['ia_collection_s'] as String?,
  key: json['key'] as String?,
  language:
      (json['language'] as List<dynamic>?)?.map((e) => e as String).toList(),
  lendingEditionS: json['lending_edition_s'] as String?,
  lendingIdentifierS: json['lending_identifier_s'] as String?,
  publicScanB: json['public_scan_b'] as bool?,
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
);

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
  'author_key': instance.authorKey,
  'author_name': instance.authorName,
  'cover_edition_key': instance.coverEditionKey,
  'cover_i': instance.coverI,
  'edition_count': instance.editionCount,
  'first_publish_year': instance.firstPublishYear,
  'has_fulltext': instance.hasFulltext,
  'ia': instance.ia,
  'ia_collection_s': instance.iaCollectionS,
  'key': instance.key,
  'language': instance.language,
  'lending_edition_s': instance.lendingEditionS,
  'lending_identifier_s': instance.lendingIdentifierS,
  'public_scan_b': instance.publicScanB,
  'title': instance.title,
  'subtitle': instance.subtitle,
};
