// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresResponse _$GenresResponseFromJson(Map<String, dynamic> json) =>
    GenresResponse(
      (json['genres'] as List<dynamic>?)
          ?.map((e) => Genres.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GenresResponseToJson(GenresResponse instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };
