import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/models/movie_detail_model.dart';
import 'package:fugi_movie_app_team6/models/movie_model.dart';
import 'package:fugi_movie_app_team6/provider/service_provider.dart';
import 'package:fugi_movie_app_team6/service/movies_service.dart';

final movieDetailProvide = StateNotifierProvider.autoDispose
    .family<MovieDetailProvider, AsyncValue<List<MovieDetailModel>>, String>(
        (ref, idMovie) {
  final providerService = ref.read(serviceProvider);
  return MovieDetailProvider(providerService, idMovie);
});

class MovieDetailProvider
    extends StateNotifier<AsyncValue<List<MovieDetailModel>>> {
  final String _idMovie;
  final MovieService _movieService;

  MovieDetailProvider(this._movieService, this._idMovie,
      [AsyncValue<List<MovieModel>>? state])
      : super(const AsyncValue.data([])) {
    searchCategories();
  }

  Future<void> searchCategories() async {
    state = const AsyncValue.loading();
    final search = await _movieService.searchMovieDetail(_idMovie);
    if (mounted) {
      state = AsyncValue.data([search]);
    }
  }
}
