import 'package:p_peliculas_app/domain/entities/movie.dart';

abstract class LocalStorageActions {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int movieId);
  Future<List<Movie>> getMovies({int limit = 10, int offset = 0});
}
