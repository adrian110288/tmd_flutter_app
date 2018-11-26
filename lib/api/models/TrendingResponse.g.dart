// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TrendingResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingResponse _$TrendingResponseFromJson(Map<String, dynamic> json) {
  return TrendingResponse(
      json['page'] as int,
      (json['results'] as List)
          ?.map((e) =>
              e == null ? null : Movie.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['total_pages'] as int,
      json['total_results'] as int);
}

Map<String, dynamic> _$TrendingResponseToJson(TrendingResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults
    };
