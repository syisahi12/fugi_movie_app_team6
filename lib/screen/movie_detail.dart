import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team6/data/movies.dart';

class MovieDetail extends StatelessWidget {
  final Movies movies;
  MovieDetail(this.movies);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MovieDetail ' + movies.title)),
    );
  }
}
