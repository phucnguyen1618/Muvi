part of 'home_bloc.dart';

enum MovieFetchStatus { initial, loading, success, failure }

class MovieFetchState extends Equatable {
  final MovieFetchStatus status;
  final List<Movie> movies1;
  final List<Movie> movies2;
  final List<Movie> movies3;
  final List<Movie> movies4;
  final bool hasMaxReached1;
  final bool hasMaxReached2;
  final bool hasMaxReached3;
  final bool hasMaxReached4;

  const MovieFetchState({
    this.status = MovieFetchStatus.initial,
    this.movies1 = const <Movie>[],
    this.movies2 = const <Movie>[],
    this.movies3 = const <Movie>[],
    this.movies4 = const <Movie>[],
    this.hasMaxReached1 = false,
    this.hasMaxReached2 = false,
    this.hasMaxReached3 = false,
    this.hasMaxReached4 = false,
  });

  MovieFetchState copyWith({
    MovieFetchStatus? status,
    List<Movie>? movies1,
    List<Movie>? movies2,
    List<Movie>? movies3,
    List<Movie>? movies4,
    bool? hasMaxReached1,
    bool? hasMaxReached2,
    bool? hasMaxReached3,
    bool? hasMaxReached4,
  }) {
    return MovieFetchState(
      status: status ?? this.status,
      movies1: movies1 ?? this.movies1,
      movies2: movies2 ?? this.movies2,
      movies3: movies3 ?? this.movies3,
      movies4: movies4 ?? this.movies4,
      hasMaxReached1: hasMaxReached1 ?? this.hasMaxReached1,
      hasMaxReached2: hasMaxReached2 ?? this.hasMaxReached2,
      hasMaxReached3: hasMaxReached3 ?? this.hasMaxReached3,
      hasMaxReached4: hasMaxReached4 ?? this.hasMaxReached4,
    );
  }

  @override
  List<Object?> get props => [
        status,
        movies1,
        movies2,
        movies3,
        movies4,
        hasMaxReached1,
        hasMaxReached2,
        hasMaxReached3,
        hasMaxReached4,
      ];
}
