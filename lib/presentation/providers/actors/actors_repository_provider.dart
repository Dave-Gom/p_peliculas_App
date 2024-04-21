import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:p_peliculas_app/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:p_peliculas_app/infrastructure/repositories/actor_repository_impl.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(datasource: ActorMovieDbDatasource());
});
