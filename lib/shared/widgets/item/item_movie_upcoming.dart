import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:Muvi/shared/styles/text_app_style.dart';
import 'package:muvi_api/models/movie.dart';

import '../../../modules/detail/view/movie_detail_page.dart';
import '../../constants/commons.dart';

class ItemMovieUpcoming extends StatelessWidget {
  final Movie movie;
  const ItemMovieUpcoming({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double textWidth = MediaQuery.of(context).size.width - 100 - 12 * 3;
    final genresForMovie = [
      'Action',
      'Adventure',
      'Science Fiction',
      'Comedy',
      'Family'
    ];
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
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.start,
          spacing: 12.0,
          children: [
            movie.posterPath.isEmpty
                ? Container(
                    width: 100,
                    height: 140,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.amberAccent,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      CommonConstants.posterUrl + movie.posterPath,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 140.0,
                    ),
                  ),
            SizedBox(
              width: textWidth,
              height: 140.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBar.builder(
                        itemSize: 16.0,
                        allowHalfRating: true,
                        initialRating: 3.5,
                        itemCount: 5,
                        unratedColor: Colors.grey,
                        itemBuilder: ((context, index) {
                          return const Icon(
                            Icons.star,
                            color: Colors.amberAccent,
                          );
                        }),
                        onRatingUpdate: (value) {},
                      ),
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        '${movie.voteCount}',
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.amberAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'Release date: ',
                      style: TextAppStyle().mediumTextBoldStyle(),
                      children: [
                        TextSpan(
                          text: movie.releaseDate,
                          style: TextAppStyle().smallTextStyle(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Wrap(
                    children: genresForMovie
                        .map(
                          (item) => Text(
                            item + ', ',
                            style: TextAppStyle().smallTextStyle(),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
