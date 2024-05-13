import 'package:isar/isar.dart';
import 'package:p_peliculas_app/domain/datasources/local_storage_datasource.dart';
import 'package:p_peliculas_app/domain/entities/movie.dart';
import 'package:path_provider/path_provider.dart';

class IsarDatasource extends LocalStorageDatasource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationCacheDirectory();
      return await Isar.open([MovieSchema], directory: dir.path);
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<List<Movie>> getMovies({int limit = 10, int offset = 0}) async {
    final isar = await db;

    return await isar.movies.where().offset(offset).limit(limit).findAll();
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final isar = await db;

    final Movie? isFavoriteMovie =
        await isar.movies.filter().idEqualTo(movieId).findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;

    final favoriteMovie =
        await isar.movies.filter().idEqualTo(movie.id).findFirst();

    if (favoriteMovie != null) {
      //borrar
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.isarId!));

      return;
    }

    //insertar
    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }
}
