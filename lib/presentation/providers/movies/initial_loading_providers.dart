import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p_peliculas_app/presentation/providers/providers.dart';

final initialLoadingProvider = Provider<bool>(
  (ref) {
    final loadingNowPlayingMovies = ref.watch(nowPlayingMoviesProvider).isEmpty;
    final loadingPopularMovies = ref.watch(pupularMoviesProviders).isEmpty;
    final loadingUpcomingMovies = ref.watch(upcomingMoviesProviders).isEmpty;
    final loadingTopRatedMovies = ref.watch(topRatedMoviesProviders).isEmpty;

    return loadingTopRatedMovies ||
        loadingUpcomingMovies ||
        loadingPopularMovies ||
        loadingNowPlayingMovies;
  },
);
