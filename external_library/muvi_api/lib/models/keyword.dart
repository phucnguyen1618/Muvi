import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'keyword.g.dart';

@immutable
@JsonSerializable()
class Keyword extends Equatable {
  int id;
  String name;

  Keyword(this.id, this.name);

  factory Keyword.fromJson(Map<String, dynamic> json) =>
      _$KeywordFromJson(json);

  Map<String, dynamic> toJson() => _$KeywordToJson(this);

  @override
  List<Object?> get props => [id, name];
}
