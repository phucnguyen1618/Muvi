import 'package:dio/dio.dart';
import 'package:muvi_api/response/cast_response.dart';
import 'package:muvi_api/response/genres_response.dart';
import 'package:muvi_api/response/keyword_response.dart';
import 'package:muvi_api/response/movie_detail_response.dart';
import 'package:muvi_api/response/review_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../response/movie_response.dart';

part 'data_muvi_api.g.dart';

@RestApi()
abstract class DataMuviAPI {
  
  factory DataMuviAPI(Dio dio) = _DataMuviAPI;

  @GET('/discover/movie')
  Future<MovieResponse> getMovieDiscover(@Query('api_key') String apiKey, @Query('page') int page);

  @GET('/movie/popular')
  Future<MovieResponse> getMoviePopular(@Query('api_key') String apiKey, @Query('page') int page);

  @GET('/movie/top_rated')
  Future<MovieResponse> getMovieTopRated(@Query('api_key') String apiKey, @Query('page') int page);

  @GET('/movie/upcoming')
  Future<MovieResponse> getMovieUpcoming(@Query('api_key') String apiKey, @Query('page') int page);

  @GET('/trending/{media_type}/week')
  Future<MovieResponse> getMediaTrendingForWeek(
      @Query('api_key') String apiKey, @Path('media_type') String mediaType, @Query('page') int page);

  //Lấy về danh sách các thể loại phim có trong database
  @GET('/genre/movie/list')
  Future<GenresResponse> getGenresForMovie(@Query('api_key') String apiKey);

  @GET('/movie/{movie_id}')
  Future<MovieDetailResponse> getMovieDetail(
      @Query('api_key') String apiKey, @Path('movie_id') int movieId);

  @GET('/movie/{movie_id}/similar')
  Future<MovieResponse> getMovieListSimilars(
      @Query('api_key') String apiKey, @Path('movie_id') int movieId, @Query('page') int page);

  //Lấy về danh sáchh các bộ phim được đề xuất cho một bộ phim
  @GET('/movie/{movie_id}/recommendations')
  Future<MovieResponse> getRecommendations(
      @Query('api_key') String apiKey, @Path('movie_id') int movieId, @Query('page') int page);

  //Lấy về danh sách dàn diễn viên và đoàn làm phim của một bộ phim
  @GET('/movie/{movie_id}/credits')
  Future<CastResponse> getCastForMovie(
      @Query('api_key') String apiKey, @Path('movie_id') int movieId);

  //Lấy về danh sách các đánh giá của người dùng cho một bộ phim.
  @GET('/movie/{movie_id}/reviews')
  Future<ReviewResponse> getReviews(
      @Query('api_key') String apiKey, @Path('movie_id') int movieId);

  //Lấy về danh sách các từ khoá cho một bộ phim
  @GET('/movie/{movie_id}/keywords')
  Future<KeywordResponse> getKeyword(@Query('api_key') String apiKey, @Path('movie_id') int movieId);
}
