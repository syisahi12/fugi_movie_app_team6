import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team6/constant/config.dart';
import 'package:fugi_movie_app_team6/models/movie_detail_model.dart';
import 'package:fugi_movie_app_team6/models/movie_model.dart';
import 'package:http/http.dart';

class MovieService {
  final String urlSearch =
      '${Config.baseUrl}search/movie?api_key=${Config.apiKey}';
  final String urlCategories = Config.baseUrl;

  Future<List<MovieModel>> searchMovies(String? title) async {
    final String search = urlSearch +
        '&language=en-US&query=' +
        '$title' +
        '&page=1&include_adult=false';
    final response = await get(Uri.parse(search));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      debugPrint('RESULT ' + result.toString());
      return result.map(((e) => MovieModel.fromJson(e))).toList();
    } else {
      debugPrint('response ${response.reasonPhrase}');
      throw Exception(response.reasonPhrase);
    }
  }

  Future<List<MovieModel>> searchCategories(String movieType) async {
    final String search = urlCategories +
        'movie/' +
        movieType +
        '?api_key=${Config.apiKey}'
            '&language=en-US&page=1';
    final response = await get(Uri.parse(search));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['results'];
      debugPrint('RESULT ' + result.toString());
      return result.map(((e) => MovieModel.fromJson(e))).toList();
    } else {
      debugPrint('response ${response.reasonPhrase}');
      throw Exception(response.reasonPhrase);
    }
  }

// https://api.themoviedb.org/3/movie/19404?api_key=ebd2cdfaaa90ae5ce496bc143d03cdc4&language=en-US
  Future<MovieDetailModel> searchMovieDetail(String idMovie) async {
    final String search = urlCategories +
        'movie/' +
        idMovie +
        '?api_key=${Config.apiKey}'
            '&language=en-US&page=1';
    final response = await get(Uri.parse(search));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      debugPrint('RESULT ' + result.toString());
      return MovieDetailModel.fromJson(result);
    } else {
      debugPrint('response ${response.reasonPhrase}');
      throw Exception(response.reasonPhrase);
    }
  }
}
