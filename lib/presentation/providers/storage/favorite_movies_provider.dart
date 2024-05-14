import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p_peliculas_app/domain/entities/movie.dart';
import 'package:p_peliculas_app/domain/repositories/local_storage_repository.dart';
import 'package:p_peliculas_app/presentation/providers/storage/local_storage_provider.dart';

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMoviesNotifier, Map<int, Movie>>((ref) {
  final localStorageRepository = ref.watch(localStorageRepositoryProvider);

  return StorageMoviesNotifier(localStorageRepository: localStorageRepository);
});

class StorageMoviesNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;

  StorageMoviesNotifier({required this.localStorageRepository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies =
        await localStorageRepository.getMovies(offset: page * 10, limit: 20);
    page++;
    final tempMovies = <int, Movie>{};
    for (var movie in movies) {
      tempMovies[movie.id] = movie;
    }
    state = {...state, ...tempMovies};

    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await localStorageRepository.toggleFavorite(movie);
    final bool isMovieInFavorites = state[movie.id] != null;

    if (isMovieInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
