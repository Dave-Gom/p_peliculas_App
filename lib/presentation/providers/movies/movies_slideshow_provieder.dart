import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p_peliculas_app/domain/entities/movie.dart';
import 'package:p_peliculas_app/presentation/providers/providers.dart';

final moviesSlideShowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

  if (nowPlayingMovies.isEmpty) return [];

  return nowPlayingMovies.sublist(0, 6);
});
