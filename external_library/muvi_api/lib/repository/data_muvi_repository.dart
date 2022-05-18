import 'package:muvi_api/response/cast_response.dart';
import 'package:muvi_api/response/genres_response.dart';
import 'package:muvi_api/response/keyword_response.dart';
import 'package:muvi_api/response/movie_detail_response.dart';
import 'package:muvi_api/response/movie_response.dart';
import 'package:muvi_api/response/review_response.dart';

abstract class DataMuviRepository {
  //Lấy về danh sách các bộ phim khám phá
  Future<MovieResponse> discover(String apiKey, {int page = 1});
  //Lấy về danh sách các bộ phim phổ biến
  Future<MovieResponse> popular(String apiKey, {int page = 1});
  //Lấy về danh sách các bộ phim có xếp hạng cao nhất
  Future<MovieResponse> topRated(String apiKey, {int page = 1});
  //Lấy về danh sách các bộ phim sắp tới được chiếu
  Future<MovieResponse> upComing(String apiKey, {int page = 1});
  Future<GenresResponse> genres(String apiKey);
  //Lấy về danh sách các bộ phim trending trong tuần
  Future<MovieResponse> trendingMoviesForWeek(String apiKey, String mediaType,
      {int page = 1});
  //Lấy về các thông tin chi tiết của một bộ phim
  Future<MovieDetailResponse> movieDetail(String apiKey, int movieId);
  Future<MovieResponse> similars(String apiKey, int movieId, {int page = 1});
  Future<MovieResponse> recommendations(String apiKey, int movieId, {int page = 1});
  Future<CastResponse> credits(String apiKey, int movieId);
  Future<ReviewResponse> reviews(String apiKey, int movieId);
  Future<KeywordResponse> keywords(String apiKey, int movieId);
}
