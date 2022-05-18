import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@immutable
@JsonSerializable()
class Review extends Equatable {
  String author;
  String content;
  @JsonKey(name: 'created_at')
  String createdAt;
  String id;
  @JsonKey(name: 'updated_at')
  String updatedAt;
  String url;

  Review(
    this.author,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  );

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  @override
  List<Object?> get props => [author, content, createdAt, id, updatedAt, url];
}
