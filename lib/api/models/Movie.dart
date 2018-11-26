import 'package:json_annotation/json_annotation.dart';

part 'Movie.g.dart';

@JsonSerializable()
class Movie {
  bool adult;

  @JsonKey(name: "backdrop_path")
  String backdropPath;

  @JsonKey(name: "genre_ids")
  List<int> genreIds;

  int id;

  @JsonKey(name: "original_language")
  String originalLanguage;

  @JsonKey(name: "original_title")
  String originalTitle;

  String overview;

  @JsonKey(name: "poster_path")
  String posterPath;

  @JsonKey(name: "release_date")
  DateTime releaseDate;

  String title;

  bool video;

  @JsonKey(name: "vote_average")
  double voteAverage;

  @JsonKey(name: "vote_count")
  int voteCount;

  double popularity;

  Movie(
      this.adult,
      this.backdropPath,
      this.genreIds,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.popularity);

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
}
