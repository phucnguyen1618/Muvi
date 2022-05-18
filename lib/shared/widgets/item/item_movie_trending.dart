import 'package:flutter/material.dart';
import 'package:Muvi/shared/constants/colors.dart';
import 'package:Muvi/shared/styles/text_app_style.dart';
import 'package:muvi_api/models/movie.dart';

import '../../constants/commons.dart';

class ItemMovieTrending extends StatelessWidget {
  final Movie movie;
  const ItemMovieTrending({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return movie.backdropPath.isEmpty
        ? Container(
            width: double.infinity,
            height: 56.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: AppColor.tabColor,
            ),
          )
        : Container(
            width: double.infinity,
            height: 56.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(
                  CommonConstants.backgroundUrl + movie.backdropPath,
                ),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                movie.title,
                style: TextAppStyle().nameMovieTextStyle(),
              ),
            ),
          );
  }
}
