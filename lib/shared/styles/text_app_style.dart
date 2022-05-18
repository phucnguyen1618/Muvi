import 'package:flutter/material.dart';
import 'package:Muvi/shared/constants/colors.dart';

class TextAppStyle {
  //home page
  TextStyle nameMovieTextStyle() {
    return const TextStyle(color: Colors.white, fontSize: 16.0);
  }

  TextStyle titleTextStyle() {
    return const TextStyle(
      fontSize: 18.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle titleBoldTextStyle() {
    return const TextStyle(
      fontSize: 16.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle categorySmallTextStyle() {
    return const TextStyle(
      fontSize: 12.0,
      color: Colors.white60,
      overflow: TextOverflow.ellipsis,
    );
  }

  TextStyle smallTextStyle() {
    return const TextStyle(
      fontSize: 12.0,
      color: Colors.white,
    );
  }

  TextStyle mediumTextBoldStyle() {
    return const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle mediumTextStyle() {
    return const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
    );
  }

  //movie detail page
  TextStyle watchTextStyle() {
    return const TextStyle(
      fontSize: 16.0,
      color: AppColor.backgroundColor,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle metricsTitleTextStyle() {
    return const TextStyle(
      fontSize: 14.0,
      color: Colors.white,
    );
  }

  TextStyle metricsTextStyle() {
    return const TextStyle(
      fontSize: 14.0,
      color: AppColor.tabColor,
    );
  }
}
