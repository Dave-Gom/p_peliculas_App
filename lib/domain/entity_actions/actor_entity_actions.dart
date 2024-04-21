import 'package:p_peliculas_app/domain/entities/actor.dart';

abstract class ActorEntityActions {
  Future<List<Actor>> getActorsByMovie(String movieId);
}
