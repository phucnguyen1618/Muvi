import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Muvi/modules/detail/bloc/movie_detail_bloc.dart';
import 'package:Muvi/modules/detail/bloc/movie_detail_state.dart';

import '../../../shared/constants/colors.dart';
import '../../../shared/constants/commons.dart';
import '../../../shared/styles/text_app_style.dart';
import '../../../shared/widgets/item/item_movie_similar.dart';

class MovieDetailView extends StatefulWidget {
  const MovieDetailView({Key? key}) : super(key: key);

  @override
  State<MovieDetailView> createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  bool _isExpanded = false;

  void _expanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: AppColor.backgroundColor,
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0, left: 8.0, right: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMovieDetail(),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'List of actors'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  _buildCastList(),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    'recommendations'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  _buildSimilarMovies(),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildFooter(),
    );
  }

  Widget _buildMovieDetail() {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: ((context, state) {
      return state.movieDetail != null
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 16.0),
                      width: 160.0,
                      height: 220.0,
                      decoration: BoxDecoration(
                          color: Colors.amberAccent,
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              CommonConstants.posterUrl +
                                  state.movieDetail!.posterPath.toString(),
                            ),
                          )),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.movieDetail!.title.toUpperCase(),
                            maxLines: 3,
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            state.movieDetail!.releaseDate.toString(),
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            state.movieDetail!.genres
                                .map((item) => item.name)
                                .toList()
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', ''),
                            style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Status: ',
                              children: [
                                TextSpan(
                                    text: state.movieDetail!.status.toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                const Text(
                  'Summary',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                _buildViewMore(state.movieDetail!.overview.toString()),
              ],
            )
          : const Center(
              child: CircularProgressIndicator(),
            );
    }));
  }

  Widget _buildFooter() {
    return SafeArea(
      child: Container(
        color: AppColor.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Container(
                height: 56.0,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: Container(
                  height: 56.0,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: AppColor.tabColor,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.play_arrow,
                        color: AppColor.backgroundColor,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        'Watch now'.toUpperCase(),
                        style: TextAppStyle().watchTextStyle(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViewMore(String summary) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        AnimatedCrossFade(
          firstChild: Text(
            summary,
            textAlign: TextAlign.left,
            maxLines: 3,
            style: TextAppStyle().mediumTextStyle(),
          ),
          secondChild: Text(
            summary,
            textAlign: TextAlign.left,
            style: TextAppStyle().mediumTextStyle(),
          ),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          duration: kThemeAnimationDuration,
        ),
        GestureDetector(
          onTap: _expanded,
          child: Text(
            _isExpanded ? CommonConstants.showLess : CommonConstants.readMore,
            style: const TextStyle(
              fontSize: 14.0,
              color: AppColor.tabColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCastList() {
    return BlocBuilder<CastBloc, CastMovieState>(builder: ((context, state) {
      return state.casts.isNotEmpty
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(state.casts.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 64,
                          height: 64,
                          decoration: state.casts[index].profilePath.isNotEmpty
                              ? BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.amberAccent,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                    CommonConstants.profilePath +
                                        state.casts[index].profilePath
                                            .toString(),
                                  )))
                              : const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.amberAccent,
                                ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          state.casts[index].name,
                          style: const TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          : const Center(child: CircularProgressIndicator());
    }));
  }

  Widget _buildSimilarMovies() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => const ItemMovieSimilar(),
        ).toList(),
      ),
    );
  }
}
