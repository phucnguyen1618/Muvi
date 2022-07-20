import 'package:equatable/equatable.dart';
import 'package:muvi_api/models/cast.dart';
import 'package:muvi_api/models/movie_detail.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;

  const MovieDetailState({this.movieDetail});

  MovieDetailState copyWith({MovieDetail? detail}) {
    return MovieDetailState(
      movieDetail: detail ?? movieDetail,
    );
  }

  @override
  List<Object?> get props => [movieDetail];
}

class CastMovieState extends Equatable {
  final List<Cast>? casts;

  const CastMovieState({this.casts});

  CastMovieState copyWith({List<Cast>? castList}) {
    return CastMovieState(casts: castList ?? casts);
  }

  @override
  List<Object?> get props => [casts];
}
