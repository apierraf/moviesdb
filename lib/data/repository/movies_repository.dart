import 'package:moviesdb/domain/models/popular_movie.dart';

abstract class PopularMoviesRepository {
  Future<PopularMovies> getPopularMovies(
    int page,
  );
}
