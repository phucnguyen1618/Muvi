import 'package:muvi_api/repository/data_muvi_repository.dart';
import 'package:muvi_api/response/keyword_response.dart';
import 'package:muvi_api/response/movie_detail_response.dart';
import 'package:muvi_api/response/cast_response.dart';
import 'package:muvi_api/response/movie_response.dart';
import 'package:muvi_api/response/genres_response.dart';
import 'package:muvi_api/response/review_response.dart';

import '../../datasource/remote/data_muvi_api.dart';

class DataMuviRepositoryImpl extends DataMuviRepository {
  final DataMuviAPI _api;

  DataMuviRepositoryImpl(this._api);

  @override
  Future<GenresResponse> genres(String apiKey) {
    return _api.getGenresForMovie(apiKey);
  }

  @override
  Future<CastResponse> credits(String apiKey, int movieId) {
    return _api.getCastForMovie(apiKey, movieId);
  }

  @override
  Future<MovieDetailResponse> movieDetail(String apiKey, int movieId) {
    return _api.getMovieDetail(apiKey, movieId);
  }

  @override
  Future<ReviewResponse> reviews(String apiKey, int movieId) {
    return _api.getReviews(apiKey, movieId);
  }

  @override
  Future<KeywordResponse> keywords(String apiKey, int movieId) {
    return _api.getKeyword(apiKey, movieId);
  }

  @override
  Future<MovieResponse> discover(String apiKey, {int? page}) {
    return _api.getMovieDiscover(apiKey, page!);
  }

  @override
  Future<MovieResponse> popular(String apiKey, {int? page}) {
    return _api.getMoviePopular(apiKey, page!);
  }

  @override
  Future<MovieResponse> recommendations(String apiKey, int movieId,
      {int? page}) {
    return _api.getRecommendations(apiKey, movieId, page!);
  }

  @override
  Future<MovieResponse> similars(String apiKey, int movieId, {int? page}) {
    return _api.getMovieListSimilars(apiKey, movieId, page!);
  }

  @override
  Future<MovieResponse> topRated(String apiKey, {int? page}) {
    return _api.getMovieTopRated(apiKey, page!);
  }

  @override
  Future<MovieResponse> trendingMoviesForWeek(String apiKey, String mediaType,
      {int? page}) {
    return _api.getMediaTrendingForWeek(apiKey, mediaType, page!);
  }

  @override
  Future<MovieResponse> upComing(String apiKey, {int? page}) {
    return _api.getMovieUpcoming(apiKey, page!);
  }
}
