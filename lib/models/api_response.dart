import 'package:json_annotation/json_annotation.dart';

import 'book.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse {
  const ApiResponse({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.apiResponseNumFound,
    this.documentationUrl,
    this.q,
    this.offset,
    this.docs,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) => _$ApiResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ApiResponseToJson(this);

  final int? numFound;
  final int? start;
  final bool? numFoundExact;
  final int? apiResponseNumFound;
  final String? documentationUrl;
  final String? q;
  final dynamic offset;
  final List<Book>? docs;
}
