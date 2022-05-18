import 'package:json_annotation/json_annotation.dart';
import 'package:muvi_api/models/genres.dart';

part 'genres_response.g.dart';

@JsonSerializable()
class GenresResponse {

  List<Genres>? genres;

  GenresResponse(this.genres);

  factory GenresResponse.fromJson(Map<String, dynamic> json) => _$GenresResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GenresResponseToJson(this);
}
