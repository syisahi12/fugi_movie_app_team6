import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fugi_movie_app_team6/models/movie_model.dart';
import 'package:fugi_movie_app_team6/provider/service_provider.dart';
import 'package:fugi_movie_app_team6/service/movies_service.dart';

final categoriesMovieProvide = StateNotifierProvider.autoDispose
    .family<CategoriesMovieProvider, AsyncValue<List<MovieModel>>, String>(
        (ref, movieType) {
  final providerService = ref.read(serviceProvider);
  return CategoriesMovieProvider(providerService, movieType);
});

class CategoriesMovieProvider
    extends StateNotifier<AsyncValue<List<MovieModel>>> {
  final String _movieType;
  final MovieService _movieService;

  CategoriesMovieProvider(this._movieService, this._movieType,
      [AsyncValue<List<MovieModel>>? state])
      : super(const AsyncValue.data([])) {
    searchCategories();
  }

  Future<void> searchCategories() async {
    state = const AsyncValue.loading();
    final search = await _movieService.searchCategories(_movieType);
    if (mounted) {
      state = AsyncValue.data([...search]);
    }
  }
}
