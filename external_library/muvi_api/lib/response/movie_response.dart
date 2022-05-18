import 'package:json_annotation/json_annotation.dart';
import 'package:muvi_api/models/movie.dart';
import 'package:muvi_api/response/base_response.dart';

part 'movie_response.g.dart';

@JsonSerializable()
class MovieResponse extends BaseResponse {
  @JsonKey(name: 'results')
  List<Movie>? movies;

  MovieResponse(this.movies);

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$MovieResponseToJson(this);
}
