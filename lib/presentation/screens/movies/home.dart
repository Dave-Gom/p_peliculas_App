import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p_peliculas_app/presentation/providers/providers.dart';
import 'package:p_peliculas_app/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CustomBottomNavigation(), body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({
    super.key,
  });

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(pupularMoviesProviders.notifier).loadNextPage();
    ref.read(topRatedMoviesProviders.notifier).loadNextPage();
    ref.read(upcomingMoviesProviders.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(pupularMoviesProviders);
    final upcomingMovies = ref.watch(upcomingMoviesProviders);
    final topRatedMovies = ref.watch(topRatedMoviesProviders);

    return CustomScrollView(slivers: [
      SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(title: CustomAppbar()),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MovieSlidershow(movies: slideShowMovies),
            MovieHorizontalListView(
                movies: nowPlayingMovies,
                title: "En cines",
                subtitle: "Lunes 20",
                loadNextPage:
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage),
            MovieHorizontalListView(
                movies: upcomingMovies,
                title: "Proximamente",
                subtitle: "Este mes",
                loadNextPage:
                    ref.read(upcomingMoviesProviders.notifier).loadNextPage),
            MovieHorizontalListView(
                movies: popularMovies,
                title: "Populares",
                loadNextPage:
                    ref.read(pupularMoviesProviders.notifier).loadNextPage),
            MovieHorizontalListView(
                movies: topRatedMovies,
                title: "Mejor calificadas",
                subtitle: "Lunes 20",
                loadNextPage:
                    ref.read(topRatedMoviesProviders.notifier).loadNextPage)
          ],
        );
      }, childCount: 1))
    ]);
  }
}
