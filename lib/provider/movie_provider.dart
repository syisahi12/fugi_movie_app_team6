import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/models/movie_model.dart';
import 'package:fugi_movie_app_team6/provider/service_provider.dart';
import 'package:fugi_movie_app_team6/service/movies_service.dart';

final movieProvide = StateNotifierProvider.autoDispose
    .family<MovieProvider, AsyncValue<List<MovieModel>>, String>((ref, title) {
  final providerService = ref.read(serviceProvider);
  return MovieProvider(providerService, title);
});

class MovieProvider extends StateNotifier<AsyncValue<List<MovieModel>>> {
  final String _title;
  final MovieService _movieService;

  MovieProvider(this._movieService, this._title,
      [AsyncValue<List<MovieModel>>? state])
      : super(const AsyncValue.data([])) {
    searchMovie();
  }

  Future<void> searchMovie() async {
    state = const AsyncValue.loading();
    final search = await _movieService.searchMovies(_title);
    if (mounted) {
      state = AsyncValue.data([...search]);
    }
  }
}
