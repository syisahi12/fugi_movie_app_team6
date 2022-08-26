import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/service/movies_service.dart';

final serviceProvider = Provider((_) => MovieService());
