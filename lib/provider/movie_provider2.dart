import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/models/movie_model.dart';
import 'package:fugi_movie_app_team6/provider/service_provider2.dart';

final movieProvider2 = FutureProvider<List<MovieModel>>((ref) async{
  String? title;
  return ref.read(serviceProvider2).searchMovies2(title ?? 'bat');
});
final movieProvider3 = FutureProvider<List<MovieModel>>((ref) async{
  String? title;
  return ref.read(serviceProvider2).searchMovies3(title ?? 'bat');
});