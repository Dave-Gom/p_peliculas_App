import 'package:p_peliculas_app/domain/datasources/movies_datasource.dart';
import 'package:p_peliculas_app/domain/entities/movie.dart';
import 'package:p_peliculas_app/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MovieRepository {
  final MovieDatasource datasource;

  MovieRepositoryImpl({required this.datasource});

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
