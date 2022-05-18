import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Muvi/di.dart';
import 'package:Muvi/modules/home/bloc/home_bloc.dart';
import 'package:Muvi/modules/home/view/home_view.dart';
import 'package:muvi_api/datasource/remote/data_muvi_api.dart';
import 'package:muvi_api/repository/impl/data_muvi_repository_impl.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        repositoryImpl: DataMuviRepositoryImpl(
          DataMuviAPI(getIt.get()),
        ),
      )
        ..add(TrendingMovieFetchEvent())
        ..add(PopularMovieFetchEvent())
        ..add(TopratedMovieFetchEvent())
        ..add(UpcomingMovieFetchEvent()),
      child: const HomeView(),
    );
  }
}
