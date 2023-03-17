import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:moviesdb/data/usecases/movies_impl.dart';
import 'package:moviesdb/domain/models/popular_movie.dart';

// The FutureProvider that does the fetching of the paginated list of movies
final paginatedPopularMoviesProvider =
    FutureProvider.family<PopularMovies, int>(
  (ref, int pageIndex) async {
    final moviesRepository = PopularMoviesImpl();
    // The API request:
    pageIndex += 1;
    return await moviesRepository.getPopularMovies(pageIndex);
  },
);

// The provider that has the value of the total count of the list items
final popularMoviesCountProvider = Provider<AsyncValue<int>>((ref) {
  return ref.watch(paginatedPopularMoviesProvider(0)).whenData(
        (PopularMovies popularMovies) => popularMovies.totalResults,
      );
});

// The provider that provides the Movies data for each list item
final currentPopularMoviesProvider = Provider<AsyncValue<Movies>>((ref) {
  throw UnimplementedError();
});
