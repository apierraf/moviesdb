import 'package:moviesdb/domain/models/details_movie.dart';
import 'package:moviesdb/domain/models/popular_movie.dart';

abstract class PopularMoviesRepository {
  Future<PopularMovies> getPopularMovies(
    int page,
  );
  Future<MoviesDetails> getMovie(int idMovie);
}
