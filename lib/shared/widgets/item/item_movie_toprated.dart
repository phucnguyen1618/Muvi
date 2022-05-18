import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:Muvi/shared/constants/colors.dart';
import 'package:Muvi/shared/constants/commons.dart';
import 'package:Muvi/shared/styles/text_app_style.dart';
import 'package:muvi_api/models/movie.dart';

class ItemMovieTopRated extends StatelessWidget {
  final Movie movie;
  const ItemMovieTopRated({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double withText = MediaQuery.of(context).size.width - 12 * 3 - 56 - 16 * 2;
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          movie.posterPath.isEmpty
              ? Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: AppColor.tabColor,
                    ),
                    child: const SizedBox(
                      width: 56.0,
                      height: 56.0,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      CommonConstants.posterUrl + movie.posterPath,
                      fit: BoxFit.cover,
                      width: 56.0,
                      height: 56.0,
                    ),
                  ),
                ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: SizedBox(
                  width: withText,
                  child: Text(
                    movie.title,
                    style: TextAppStyle().titleBoldTextStyle(),
                  ),
                ),
              ),
              Text(
                'Drama, Fantasy, Historical, Manga, Shounen',
                style: TextAppStyle().categorySmallTextStyle(),
              ),
              RatingBar.builder(
                itemSize: 16.0,
                allowHalfRating: true,
                initialRating: 2.8,
                itemCount: 5,
                unratedColor: Colors.grey,
                itemBuilder: ((context, index) {
                  return const Icon(
                    Icons.star,
                    color: AppColor.tabColor,
                  );
                }),
                onRatingUpdate: (value) {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
