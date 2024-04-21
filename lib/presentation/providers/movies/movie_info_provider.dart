import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p_peliculas_app/domain/entities/movie.dart';
import 'package:p_peliculas_app/presentation/providers/providers.dart';

final movieInfoProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(fetchMoreMovies.getMovieById);
});

typedef GetMovieCallback = Future<Movie> Function(String);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier(this.getMovie) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    print("Realizando peticion http");
    final movie = await getMovie(movieId);

    state = {...state, movieId: movie};
  }
}
