import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmd_app/api/api_const.dart';
import 'package:tmd_app/api/models/Movie.dart';
import 'package:tmd_app/pages/Rating.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  MovieDetailPage(this.movie);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {

  Widget _buildHeroImage(String imageUrl) {
    return AspectRatio(
      aspectRatio: 1.75,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              alignment: FractionalOffset.topCenter,
              image: CachedNetworkImageProvider(
                imageUrl,
              ),
            )
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnailImage(String imageUrl) {
    var imageShadow = [
      new BoxShadow(
          color: Colors.black54,
          blurRadius: 8.0,
          offset: Offset(0.0, 8.0),
          spreadRadius: -5.0),
    ];

    return Container(
      decoration: BoxDecoration(
        boxShadow: imageShadow,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4.0),
        child: Image(
          image: CachedNetworkImageProvider(
            imageUrl,
          ),
          height: 100,
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }

  Widget _buildDetails(String imageUrl,
      String movieTitle,
      double voteAverage) {
    var title = Text(
      movieTitle,
      textAlign: TextAlign.left,
      softWrap: true,
      style: Theme
          .of(context)
          .textTheme
          .headline,
    );

    var rating = Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Rating(
        Icons.star,
        10,
        voteAverage,
        Colors.blue,
        Color.fromARGB(255, 191, 228, 242),
        showRatingLabel: true,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                _buildThumbnailImage(imageUrl),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[title, rating],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildPage(BuildContext context) {
    var imageUrl = "$API_IMAGE_BASE_URL/original/${widget.movie.posterPath}";

    return Scaffold(
      body:
      Column(
        children: <Widget>[
          _buildHeroImage(imageUrl),
          _buildDetails(imageUrl,
              widget.movie.originalTitle,
              widget.movie.voteAverage)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildPage(context);
  }

}
