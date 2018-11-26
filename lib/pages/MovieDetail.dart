import 'package:flutter/material.dart';
import 'package:tmd_app/res/colors.dart';

class MovieDetailPage extends StatelessWidget {
  final int movieId;

  MovieDetailPage(this.movieId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WINDOW_COLOR,
      body: Center(child: Text("Hello detail")),
    );
  }
}
