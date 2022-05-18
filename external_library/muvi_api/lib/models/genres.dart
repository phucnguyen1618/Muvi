import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'genres.g.dart';

@immutable
@JsonSerializable()
class Genres extends Equatable {
  int id;
  String name;

  Genres(this.id, this.name);

  factory Genres.fromJson(Map<String, dynamic> json) => _$GenresFromJson(json);
  Map<String, dynamic> toJson() => _$GenresToJson(this);

  @override
  List<Object?> get props => [id, name];
}
