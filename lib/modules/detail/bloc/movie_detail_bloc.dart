import 'package:bloc/bloc.dart';
import 'package:Muvi/modules/detail/bloc/movie_detail_event.dart';
import 'package:Muvi/modules/detail/bloc/movie_detail_state.dart';
import 'package:Muvi/shared/constants/commons.dart';
import 'package:muvi_api/repository/impl/data_muvi_repository_impl.dart';
import 'package:muvi_api/response/cast_response.dart';
import 'package:muvi_api/response/movie_detail_response.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final DataMuviRepositoryImpl repositoryImpl;

  MovieDetailBloc({required this.repositoryImpl})
      : super(const MovieDetailState()) {
    on<MovieDetailEvent>(_onFetchMovieDetail);
  }

  Future<void> _onFetchMovieDetail(
      MovieDetailEvent event, Emitter<MovieDetailState> emit) async {
    try {
      MovieDetailResponse detailResponse = await repositoryImpl.movieDetail(
          CommonConstants.apiKey, event.movieId);

      return emit(state.copyWith(
        detail: detailResponse.movieDetail,
      ));
    } catch (error) { 
      emit(state.copyWith());
    }
  }
}

class CastBloc extends Bloc<CastMovieEvent, CastMovieState> {
  final DataMuviRepositoryImpl repositoryImpl;

  CastBloc({required this.repositoryImpl})
      : super(const CastMovieState()) {
    on<CastMovieEvent>(_onFetchCastMovieList);
  }

  Future<void> _onFetchCastMovieList(
      CastMovieEvent event, Emitter<CastMovieState> emit) async {
    try {
      CastResponse castResponse =
          await repositoryImpl.credits(CommonConstants.apiKey, event.movieId);
      return emit(state.copyWith(
        castList: castResponse.castList,
      ));
    } catch (error) {
      emit(state.copyWith());
    }
  }
}
