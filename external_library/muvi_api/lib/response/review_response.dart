import 'package:json_annotation/json_annotation.dart';
import 'package:muvi_api/models/review.dart';
import 'package:muvi_api/response/base_response.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse extends BaseResponse {
  
  List<Review> results;

  ReviewResponse(this.results);

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);
}
