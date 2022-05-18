part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieFetchEvent extends HomeEvent {}

class TrendingMovieFetchEvent extends MovieFetchEvent {}

class PopularMovieFetchEvent extends MovieFetchEvent {}

class TopratedMovieFetchEvent extends MovieFetchEvent {}

class UpcomingMovieFetchEvent extends MovieFetchEvent {}
