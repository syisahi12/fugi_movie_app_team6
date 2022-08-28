import 'package:fugi_movie_app_team6/constant/utils.dart';

class MovieModel {

  final bool adult;
  final String backdropPath;
  // final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  // final String popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final num voteAverage;
  // final int voteCount;

  MovieModel({
    required this.adult,
    required this.backdropPath,
    // required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    // required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    // required this.voteCount,
  });

  String get posterPathUrl => Utils.getImageUrl(posterPath);
  String get backdropPathUrl => Utils.getImageUrl(backdropPath, 1280);
  // num get voteAverageRounded => double.parse(voteAverage.toStringAsFixed(1));

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'] ?? '',
      // genreIds: json['genres']?.cast<int>() ?? <int>[],
      id: json['id'] ?? '',
      originalLanguage: json['original_language'] ?? '',
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'] ?? '',
      // popularity: json['popularity'] ?? '',
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? '',
      voteAverage: json['vote_average']  ?? 0,
      // voteCount: json['voteCount'] ?? '',
    );
  }
}
