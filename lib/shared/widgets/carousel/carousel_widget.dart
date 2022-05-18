import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:Muvi/modules/detail/view/movie_detail_page.dart';
import 'package:Muvi/shared/constants/colors.dart';
import 'package:muvi_api/models/movie.dart';

import '../item/item_movie_trending.dart';

class CarouselWidget extends StatefulWidget {
  final List<Movie> movies;

  const CarouselWidget({
    Key? key,
    required this.movies,
  }) : super(key: key);

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CarouselSlider(
          carouselController: _controller,
          options: CarouselOptions(
              aspectRatio: 2.0,
              enlargeCenterPage: true,
              autoPlay: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              }),
          items: List<Widget>.generate(
            6,
            (index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailPage(movieId: widget.movies[index].id),
                  ),
                );
              },
              child: ItemMovieTrending(movie: widget.movies[index]),
            ),
          ).toList(),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            6,
            (index) => Container(
              width: 8.0,
              height: 8.0,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? AppColor.dotColor
                    : AppColor.cancelColor,
              ),
            ),
          ).toList(),
        ),
      ],
    );
  }
}
