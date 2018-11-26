import 'package:json_annotation/json_annotation.dart';
import 'package:tmd_app/api/models/Movie.dart';

part 'TrendingResponse.g.dart';

@JsonSerializable()
class TrendingResponse {
  int page;

  List<Movie> results;

  @JsonKey(name: "total_pages")
  int totalPages;

  @JsonKey(name: "total_results")
  int totalResults;

  TrendingResponse(this.page, this.results, this.totalPages, this.totalResults);

  factory TrendingResponse.fromJson(Map<String, dynamic> json) =>
      _$TrendingResponseFromJson(json);
}
