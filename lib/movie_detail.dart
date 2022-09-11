import 'package:flutter/material.dart';
import 'movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  MovieDetail(this.movie);
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterpath != null) {
      path = imgPath + (movie.posterpath).toString();
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text((movie.title).toString()),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text((movie.overview).toString()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
