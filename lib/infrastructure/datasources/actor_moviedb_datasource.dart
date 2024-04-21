import 'package:dio/dio.dart';
import 'package:p_peliculas_app/config/constants/environment.dart';
import 'package:p_peliculas_app/domain/datasources/actor_datasource.dart';
import 'package:p_peliculas_app/domain/entities/actor.dart';
import 'package:p_peliculas_app/infrastructure/mapprers/actor_mapper.dart';
import 'package:p_peliculas_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovidDbKey,
        'language': 'es_MX'
      }));

  List<Actor> _jsonToActors(Map<String, dynamic> json) {
    final movieDbResponse = CreditsResponse.fromJson(json);

    final List<Actor> movies = movieDbResponse.cast
        .map((movieDb) => ActorMapper.castToEntity(movieDb))
        .toList();

    return movies;
  }

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    if (response.statusCode != 200) {
      throw Exception('Movie with id: $movieId not found');
    }

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
