import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Muvi/di.dart';
import 'package:Muvi/modules/detail/bloc/movie_detail_event.dart';
import 'package:Muvi/modules/detail/view/movie_detail_view.dart';
import 'package:muvi_api/datasource/remote/data_muvi_api.dart';
import 'package:muvi_api/repository/impl/data_muvi_repository_impl.dart';

import '../bloc/movie_detail_bloc.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieId;
  const MovieDetailPage({Key? key, required this.movieId}) : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MovieDetailBloc(
            repositoryImpl: DataMuviRepositoryImpl(
              DataMuviAPI(getIt.get()),
            ),
          )..add(MovieDetailEvent(
              movieId: widget.movieId,
            )),
        ),
        BlocProvider(
          create: (_) => CastBloc(
            repositoryImpl: DataMuviRepositoryImpl(
              DataMuviAPI(getIt.get()),
            ),
          )..add(CastMovieEvent(
              movieId: widget.movieId,
            )),
        )
      ],
      child: const MovieDetailView(),
    );
  }
}
