import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:Muvi/shared/constants/commons.dart';
import 'package:muvi_api/models/movie.dart';
import 'package:muvi_api/repository/impl/data_muvi_repository_impl.dart';
import 'package:muvi_api/response/movie_response.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, MovieFetchState> {
  final DataMuviRepositoryImpl repositoryImpl;

  HomeBloc({required this.repositoryImpl}) : super(const MovieFetchState()) {
    on<TrendingMovieFetchEvent>(_onFetchTrendingMovieList);
    on<PopularMovieFetchEvent>(_onFetchPopularMovieList);
    on<TopratedMovieFetchEvent>(_onFetchTopratedMovieList);
    on<UpcomingMovieFetchEvent>(_onFetchUpcomingMovieList);
  }

  Future<void> _onFetchTrendingMovieList(
      TrendingMovieFetchEvent event, Emitter<MovieFetchState> emit) async {
    if (state.hasMaxReached1) return;
    try {
      MovieResponse responseTrending = await repositoryImpl
          .trendingMoviesForWeek(CommonConstants.apiKey, 'movie', page: 1);
      emit(state.copyWith(
        status: MovieFetchStatus.success,
        movies1: responseTrending.movies,
        hasMaxReached1: false,
      ));
    } catch (error) {
      log(error.toString());
      emit(state.copyWith(
        status: MovieFetchStatus.failure,
      ));
    }
  }

  Future<void> _onFetchPopularMovieList(
      PopularMovieFetchEvent event, Emitter<MovieFetchState> emit) async {
    if (state.hasMaxReached2) return;
    try {
      MovieResponse responsePopular =
          await repositoryImpl.popular(CommonConstants.apiKey, page: 1);
      emit(state.copyWith(
        status: MovieFetchStatus.success,
        movies2: responsePopular.movies,
        hasMaxReached2: false,
      ));
    } catch (error) {
      log(error.toString());
      emit(state.copyWith(
        status: MovieFetchStatus.failure,
      ));
    }
  }

  Future<void> _onFetchTopratedMovieList(
      TopratedMovieFetchEvent event, Emitter<MovieFetchState> emit) async {
    if (state.hasMaxReached3) return;
    try {
      MovieResponse responseToprated =
          await repositoryImpl.topRated(CommonConstants.apiKey, page: 1);
      emit(state.copyWith(
        status: MovieFetchStatus.success,
        movies3: responseToprated.movies,
        hasMaxReached3: false,
      ));
    } catch (error) {
      log(error.toString());
      emit(state.copyWith(
        status: MovieFetchStatus.failure,
      ));
    }
  }

  Future<void> _onFetchUpcomingMovieList(
      UpcomingMovieFetchEvent event, Emitter<MovieFetchState> emit) async {
    if (state.hasMaxReached4) return;
    try {
      if (state.status == MovieFetchStatus.initial) {
        MovieResponse responseUpcoming =
            await repositoryImpl.upComing(CommonConstants.apiKey, page: 1);
        emit(state.copyWith(
          status: MovieFetchStatus.success,
          movies4: responseUpcoming.movies,
          hasMaxReached4: false,
        ));
      }
      MovieResponse responseUpcoming = await repositoryImpl.upComing(
          CommonConstants.apiKey,
          page: state.movies4.length ~/ 20 + 1);
      emit(responseUpcoming.movies!.isEmpty
          ? state.copyWith(hasMaxReached4: true)
          : state.copyWith(
              status: MovieFetchStatus.success,
              movies4: List.of(state.movies4)..addAll(responseUpcoming.movies!),
              hasMaxReached4: false,
            ));
    } catch (error) {
      log(error.toString());
      emit(state.copyWith(
        status: MovieFetchStatus.failure,
      ));
    }
  }
}
