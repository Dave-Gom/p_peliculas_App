import 'package:dio/dio.dart';
import 'package:p_peliculas_app/config/constants/environment.dart';
import 'package:p_peliculas_app/domain/datasources/movies_datasource.dart';
import 'package:p_peliculas_app/domain/entities/movie.dart';

class MovieDBDatasource extends MovieDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovidDbKey,
        'language': 'es_MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');

    final List<Movie> movies = [];
    return [];
  }
}
