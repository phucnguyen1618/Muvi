import 'package:muvi_api/models/movie_detail.dart';

class MovieDetailResponse {
  MovieDetail movieDetail;
  String error;

  MovieDetailResponse(this.movieDetail, this.error);

  MovieDetailResponse.fromJson(Map<String, dynamic> json)
      : movieDetail = MovieDetail.fromJson(json),
        error = '';
}
