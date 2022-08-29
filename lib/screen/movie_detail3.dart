import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team6/constant/colors.dart';
import 'package:fugi_movie_app_team6/models/movie_model.dart';
import 'package:fugi_movie_app_team6/screen/detail/widgets/build_bottom.dart';

class MovieDetail3 extends StatefulWidget {

  final MovieModel movies;
  MovieDetail3(this.movies, {Key? key}) : super(key: key);

  @override
  State<MovieDetail3> createState() => _MovieDetail3State();
}

class _MovieDetail3State extends State<MovieDetail3>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackground,
        appBar: AppBar(title: const Text('MovieDetail3'),),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const Text('POSTER IMAGE ',style: TextStyle(color: Colors.white,)),
              Text(widget.movies.posterPath, style: const TextStyle(color: Colors.green, fontSize: 16, overflow: TextOverflow.ellipsis),maxLines: 4),
              const SizedBox(height: 10),
              const Text('BACKGROUND IMAGE ',style: TextStyle(color: Colors.white,)),
              Text(widget.movies.backdropPath, style: const TextStyle(color: Colors.green, fontSize: 16, overflow: TextOverflow.ellipsis),maxLines: 4,),
              const SizedBox(height: 10),
              const Text('TITLE ',style: TextStyle(color: Colors.white,)),
              Text(widget.movies.title, style: const TextStyle(color: Colors.green, fontSize: 16, overflow: TextOverflow.ellipsis),maxLines: 4),
              const SizedBox(height: 10),
              const Text('OVERVIEW ',style: TextStyle(color: Colors.white,)),
              Text(widget.movies.overview, style: const TextStyle(color: Colors.green, fontSize: 16, overflow: TextOverflow.ellipsis),maxLines: 4),
              const SizedBox(height: 10),
              const Text('RELEASE DATE ',style: TextStyle(color: Colors.white,)),
              Text(widget.movies.releaseDate, style: const TextStyle(color: Colors.green, fontSize: 16, overflow: TextOverflow.ellipsis),maxLines: 4),
              const SizedBox(height: 10),
              const Text('AVERAGE RATTING ',style: TextStyle(color: Colors.white,)),
              Text(widget.movies.voteAverage.toString(), style: const TextStyle(color: Colors.green, fontSize: 16, overflow: TextOverflow.ellipsis),maxLines: 4),
              const SizedBox(height: 10),
              const Text('RATE COUNT ',style: TextStyle(color: Colors.white,)),
              Text(widget.movies.voteCount.toString(), style: const TextStyle(color: Colors.green, fontSize: 16, overflow: TextOverflow.ellipsis),maxLines: 4),
              const SizedBox(height: 10),
              const Text('POPULARITY ',style: TextStyle(color: Colors.white,)),
              Text(widget.movies.popularity.toString(), style: const TextStyle(color: Colors.green, fontSize: 16, overflow: TextOverflow.ellipsis),maxLines: 4),
              const SizedBox(height: 10),
              // Text(widget.movies.id.toString(), style: TextStyle(color: Colors.green, fontSize: 16, overflow: TextOverflow.ellipsis),),
            ],
          ),
        ),);
  }
}
