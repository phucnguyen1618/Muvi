import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Muvi/modules/home/bloc/home_bloc.dart';
import 'package:Muvi/shared/styles/text_app_style.dart';
import '../carousel/carousel_widget.dart';
import '../item/item_movie_popular.dart';
import '../item/item_movie_toprated.dart';
import '../item/item_movie_upcoming.dart';

class MovieWidget extends StatefulWidget {
  const MovieWidget({Key? key}) : super(key: key);

  @override
  State<MovieWidget> createState() => _MovieWidgetState();
}

class _MovieWidgetState extends State<MovieWidget> {
  final _upcomingScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _upcomingScrollController.addListener(_onUpcomingScrollList);
  }

  @override
  void dispose() {
    super.dispose();

    _upcomingScrollController
      ..removeListener(_onUpcomingScrollList)
      ..dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTrendingMovie(),
            _buildPopularMovieList('Popular'),
            _buildTopratedMovieList('Top rated'),
            _buildUpcomingMovieList('Up coming'),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingMovie() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<HomeBloc, MovieFetchState>(builder: ((context, state) {
          if (state.movies1.isNotEmpty) {
            return CarouselWidget(
              movies: state.movies1,
            );
          }
          return const CircularProgressIndicator();
        })),
      ],
    );
  }

  Widget _buildPopularMovieList(String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<HomeBloc, MovieFetchState>(builder: ((context, state) {
          if (state.movies2.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    title,
                    style: TextAppStyle().titleTextStyle(),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List<Widget>.generate(
                        10,
                        (index) => ItemMoviePopular(
                          movie: state.movies2[index],
                        ),
                      ).toList(),
                    ),
                  )
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        })),
      ],
    );
  }

  Widget _buildTopratedMovieList(String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BlocBuilder<HomeBloc, MovieFetchState>(builder: ((context, state) {
          if (state.movies3.isNotEmpty) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    title,
                    style: TextAppStyle().titleTextStyle(),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 200.0,
                    child: PageView.builder(
                      itemCount: state.movies3.length ~/ 3,
                      itemBuilder: ((context, index) {
                        return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: ((context, index) {
                              return ItemMovieTopRated(
                                movie: state.movies3[index],
                              );
                            }),
                            separatorBuilder: (contex, index) =>
                                const SizedBox(height: 16),
                            itemCount: 3);
                      }),
                      onPageChanged: (index) {},
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'View more',
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_outlined,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        })),
      ],
    );
  }

  Widget _buildUpcomingMovieList(String title) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        BlocBuilder<HomeBloc, MovieFetchState>(builder: (context, state) {
          if (state.movies4.isNotEmpty) {
            return Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    title,
                    style: TextAppStyle().titleTextStyle(),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  ListView.builder(
                    controller: _upcomingScrollController,
                    itemCount: state.hasMaxReached4
                        ? state.movies4.length
                        : state.movies4.length + 1,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return index >= state.movies4.length
                          ? const Center(child: CircularProgressIndicator())
                          : ItemMovieUpcoming(
                              movie: state.movies4[index],
                            );
                    }),
                  ),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        })
      ],
    );
  }

  _onUpcomingScrollList() {
    if (_isBottom) context.read<HomeBloc>().add(UpcomingMovieFetchEvent());
  }

  bool get _isBottom {
    if (!_upcomingScrollController.hasClients) return false;
    final maxScroll = _upcomingScrollController.position.maxScrollExtent;
    final currentScroll = _upcomingScrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
