import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p_peliculas_app/domain/entities/actor.dart';
import 'package:p_peliculas_app/presentation/providers/actors/actors_repository_provider.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);

  return ActorsByMovieNotifier(actorsRepository.getActorsByMovie);
});

typedef GetMovieCallback = Future<List<Actor>> Function(String);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetMovieCallback getActors;

  ActorsByMovieNotifier(this.getActors) : super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) return;
    final actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
