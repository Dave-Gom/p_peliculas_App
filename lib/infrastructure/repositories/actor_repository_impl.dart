import 'package:p_peliculas_app/domain/datasources/actor_datasource.dart';
import 'package:p_peliculas_app/domain/entities/actor.dart';
import 'package:p_peliculas_app/domain/repositories/actor_repository.dart';

class ActorRepositoryImpl extends ActorRepository {
  final ActorDatasource datasource;

  ActorRepositoryImpl({required this.datasource});

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }
}
