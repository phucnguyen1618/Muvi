import 'package:json_annotation/json_annotation.dart';
import 'package:muvi_api/models/cast.dart';

part 'cast_response.g.dart';

@JsonSerializable()
class CastResponse {
  int id;
  @JsonKey(name: 'cast')
  List<Cast> castList;

  CastResponse(this.id, this.castList);

  factory CastResponse.fromJson(Map<String, dynamic> json) =>
      _$CastResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CastResponseToJson(this);
}
