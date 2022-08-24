import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fugi_movie_app_team6/constant/config.dart';
import 'package:fugi_movie_app_team6/models/movie_model.dart';
import 'package:http/http.dart';

class MovieService {
  final String urlSearch =
      '${Config.baseUrl}search/movie?api_key=${Config.apiKey}';

  // final result = await get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=ebd2cdfaaa90ae5ce496bc143d03cdc4'));
  //https://api.themoviedb.org/3/search/movie?api_key=ebd2cdfaaa90ae5ce496bc143d03cdc4&language=en-US&query=bat&page=1&include_adult=false
  Future<List> searchMovies(String title) async {
    List<dynamic> searchList = [];
    final String search = urlSearch +
        '&language=en-US&query=' +
        title +
        '&page=1&include_adult=false';
    final response = await get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=ebd2cdfaaa90ae5ce496bc143d03cdc4&language=en-US&query=bat&page=1&include_adult=false'));
    // final response = await get(Uri.parse(search));
    debugPrint('response ${response.body.toString()}');
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      if (body['results'] != null) {
        searchList =  body['results'].map((data) => MovieModel.fromJson(data)).toList();
        // searchList = body['results'];
      } else {
        debugPrint('SEARCH LIST $searchList');
      }
    }
    debugPrint('SEARCH LIST $searchList');
    return searchList;
  }

  Future<List<MovieModel>> searchMovies2(String title) async {
    List<MovieModel> searchList = [];
    final response = await get(Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=ebd2cdfaaa90ae5ce496bc143d03cdc4&language=en-US&query=bat&page=1&include_adult=false'));
    debugPrint('response ${response.body.toString()}');
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      if (body['results'] != null) {
        searchList =  body['results'].map((data) => MovieModel.fromJson(data)).toList();
        // searchList = body['results'];
      } else {
        debugPrint('SEARCH LIST $searchList');
      }
    }
    debugPrint('SEARCH LIST $searchList');
    return searchList;
  }

  // Future<List<MovieModel>> searchMovies4() async {
  //   final response = await get(Uri.parse(
  //       'https://api.themoviedb.org/3/search/movie?api_key=ebd2cdfaaa90ae5ce496bc143d03cdc4&language=en-US&query=bat&page=1&include_adult=false'));
  //   debugPrint('response ${response.body.toString()}');
  //   if (response.statusCode == 200) {
  //     var body = jsonDecode(response.body);
  //     if (body['results'] != null) {
  //       return  body['results'].map((data) => MovieModel.fromJson(data)).toList();
  //       // searchList = body['results'];
  //     } else {
  //       throw Exception(response.reasonPhrase);
  //     }
  //   }
  // }

  Future<List<MovieModel>> searchMovies3(String? title) async {
    final String search = urlSearch +
        '&language=en-US&query=' +
        '$title' +
        '&page=1&include_adult=false';
    final response = await get(Uri.parse(search));
    if (response.statusCode == 200) {
    // final response = await get(Uri.parse(
    //     'https://api.themoviedb.org/3/search/movie?api_key=ebd2cdfaaa90ae5ce496bc143d03cdc4&language=en-US&query=bat&page=1&include_adult=false'));
    //       if (response.statusCode == 200) {
      var  result2 = jsonDecode(response.body);
      final List result = jsonDecode(response.body)['results'];
      debugPrint('URL SEARCH '+ search);
      debugPrint('RESULT '+ result.toString());
      return result.map(((e) => MovieModel.fromJson(e))).toList();
    } else {
      debugPrint('response ${response.reasonPhrase}');
      throw Exception(response.reasonPhrase);
    }
  }


}
