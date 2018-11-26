import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tmd_app/api/ApiService.dart';
import 'package:tmd_app/api/api_const.dart';
import 'package:tmd_app/api/models/Movie.dart';
import 'package:tmd_app/pages/MovieDetailPage.dart';
import 'package:tmd_app/pages/Rating.dart';
import 'package:tmd_app/res/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Movie> movieList;

  @override
  void initState() {
    super.initState();

    ApiService()
        .getTrending()
        .then((response) => setState(() => movieList = response.results))
        .whenComplete(() => print(movieList));
  }

  Widget _buildCardItem(BuildContext context, int index) {
    Movie movie = movieList[index];
    var imageUrl = "$API_IMAGE_BASE_URL/original/${movie.posterPath}";

    var imageShadow = [
      new BoxShadow(
          color: Colors.black54,
          blurRadius: 8.0,
          offset: Offset(0.0, 8.0),
          spreadRadius: -5.0),
    ];

    var image = Container(
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

    var title = Text(
      movie.title,
      textAlign: TextAlign.left,
      softWrap: true,
      style: Theme.of(context).textTheme.headline,
    );

    var rating = Padding(
      padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Rating(
        Icons.star,
        10,
        movie.voteAverage,
        Colors.blue,
        Color.fromARGB(255, 191, 228, 242),
      ),
    );

    var miniDescription = Text(
      movie.overview,
      style: Theme.of(context).textTheme.body1,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
      textAlign: TextAlign.left,
    );

    var divider = Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Container(
        color: Colors.grey[200],
        height: 1.0,
      ),
    );

    var _itemTapHandler = () =>
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MovieDetailPage(movie)),
        );

    return GestureDetector(
      onTap: _itemTapHandler,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                image,
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[title, rating, miniDescription],
                    ),
                  ),
                )
              ],
            ),
            divider
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Trending",
              style: Theme.of(context).textTheme.headline.copyWith(
                color: Colors.white,
                letterSpacing: 1.8,
              )),
        ),
      ),
      backgroundColor: WINDOW_COLOR,
      body: new ListView.builder(
        itemCount: movieList == null ? 0 : movieList.length,
        itemBuilder: (BuildContext context, int index) =>
            _buildCardItem(context, index),
      ),
    );
  }
}
