import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:muvi_api/models/genres.dart';

part 'movie_detail.g.dart';

@immutable
@JsonSerializable()
class MovieDetail extends Equatable {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  double budget;
  List<Genres> genres;
  @JsonKey(name: 'homepage')
  String? homePage;
  int id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  @JsonKey(name: 'original_language')
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String? overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'release_date')
  String releaseDate;
  String status;
  String title;
  bool video;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;

  MovieDetail(
      this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homePage,
      this.id,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.status,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount);

  factory MovieDetail.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailFromJson(json);
  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        budget,
        genres,
        homePage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        status,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
