import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/constant/movie_type.dart';

final movieTypeProvider = StateProvider<MovieType>((ref) => MovieType.popular);