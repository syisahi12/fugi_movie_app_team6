import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/models/movie_model.dart';
import 'package:fugi_movie_app_team6/provider/service_provider.dart';
import 'package:fugi_movie_app_team6/service/movies_service.dart';

final movieProvide =
    StateNotifierProvider<MovieProvider, AsyncValue<List<MovieModel>>>((ref) {
  final providerService = ref.read(serviceProvider);
  return MovieProvider(providerService);
});

class MovieProvider extends StateNotifier<AsyncValue<List<MovieModel>>> {
  String? title;

  MovieProvider(this._movieService, [AsyncValue<List<MovieModel>>? state])
      : super(AsyncValue.data([])) {
    searchMovie(title ?? '');
  }

  final MovieService? _movieService;

  Future<void> searchMovie(String title) async {
    state = AsyncValue.loading();
    final search = await _movieService!.searchMovies(title);
    if (mounted) {
      state = AsyncValue.data([...search]);
    }
  }
}
