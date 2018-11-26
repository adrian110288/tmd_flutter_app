// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      json['adult'] as bool,
      json['backdrop_path'] as String,
      (json['genre_ids'] as List)?.map((e) => e as int)?.toList(),
      json['id'] as int,
      json['original_language'] as String,
      json['original_title'] as String,
      json['overview'] as String,
      json['poster_path'] as String,
      json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
      json['title'] as String,
      json['video'] as bool,
      (json['vote_average'] as num)?.toDouble(),
      json['vote_count'] as int,
      (json['popularity'] as num)?.toDouble());
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'genre_ids': instance.genreIds,
      'id': instance.id,
      'original_language': instance.originalLanguage,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'release_date': instance.releaseDate?.toIso8601String(),
      'title': instance.title,
      'video': instance.video,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'popularity': instance.popularity
    };
