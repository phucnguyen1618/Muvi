import 'package:equatable/equatable.dart';

class MovieDetailEvent extends Equatable {
  final int movieId;

  const MovieDetailEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}

class CastMovieEvent extends Equatable {
  final int movieId;

  const CastMovieEvent({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
