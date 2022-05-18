import 'package:flutter/material.dart';
import 'package:Muvi/modules/detail/view/movie_detail_page.dart';
import 'package:Muvi/shared/constants/commons.dart';
import 'package:muvi_api/models/movie.dart';

class ItemMoviePopular extends StatelessWidget {
  final Movie movie;
  const ItemMoviePopular({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => MovieDetailPage(
              movieId: movie.id,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 16.0),
        width: 160.0,
        height: 220.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(
              CommonConstants.posterUrl + movie.posterPath,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
