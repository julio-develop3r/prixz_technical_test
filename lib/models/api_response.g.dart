// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) => ApiResponse(
  numFound: (json['numFound'] as num?)?.toInt(),
  start: (json['start'] as num?)?.toInt(),
  numFoundExact: json['numFoundExact'] as bool?,
  apiResponseNumFound: (json['apiResponseNumFound'] as num?)?.toInt(),
  documentationUrl: json['documentationUrl'] as String?,
  q: json['q'] as String?,
  offset: json['offset'],
  docs:
      (json['docs'] as List<dynamic>?)
          ?.map((e) => Book.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$ApiResponseToJson(ApiResponse instance) =>
    <String, dynamic>{
      'numFound': instance.numFound,
      'start': instance.start,
      'numFoundExact': instance.numFoundExact,
      'apiResponseNumFound': instance.apiResponseNumFound,
      'documentationUrl': instance.documentationUrl,
      'q': instance.q,
      'offset': instance.offset,
      'docs': instance.docs,
    };
